CREATE table bi.account_invoice_report AS
 WITH currency_rate AS (
         SELECT r.currency_id,
            COALESCE(r.company_id, c.id) AS company_id,
            r.rate,
            r.name AS date_start,
            ( SELECT r2.name
                   FROM public.res_currency_rate r2
                  WHERE ((r2.name > r.name) AND (r2.currency_id = r.currency_id) AND ((r2.company_id IS NULL) OR (r2.company_id = c.id)))
                  ORDER BY r2.name
                 LIMIT 1) AS date_end
           FROM (public.res_currency_rate r
             JOIN public.res_company c ON (((r.company_id IS NULL) OR (r.company_id = c.id))))
        )
 SELECT sub.id,
    sub.date,
    sub.product_id,
    sub.partner_id,
    sub.country_id,
    sub.account_analytic_id,
    sub.payment_term_id,
    sub.uom_name,
    sub.currency_id,
    sub.journal_id,
    sub.fiscal_position_id,
    sub.user_id,
    sub.company_id,
    sub.nbr,
    sub.type,
    sub.state,
    sub.weight,
    sub.volume,
    sub.categ_id,
    sub.date_due,
    sub.account_id,
    sub.account_line_id,
    sub.partner_bank_id,
    sub.product_qty,
    sub.price_total,
    sub.price_average,
    COALESCE(cr.rate, (1)::numeric) AS currency_rate,
    sub.residual,
    sub.commercial_partner_id,
    sub.document_type_id,
    sub.team_id
   FROM (( SELECT ail.id,
            ai.date_invoice AS date,
            ail.product_id,
            ai.partner_id,
            ai.payment_term_id,
            ail.account_analytic_id,
            u2.name AS uom_name,
            ai.currency_id,
            ai.journal_id,
            ai.fiscal_position_id,
            ai.user_id,
            ai.company_id,
            1 AS nbr,
            ai.type,
            ai.state,
            pt.categ_id,
            ai.date_due,
            ai.account_id,
            ail.account_id AS account_line_id,
            ai.partner_bank_id,
            sum(((((invoice_type.sign_qty)::numeric * ail.quantity) / u.factor) * u2.factor)) AS product_qty,
            sum((ail.price_subtotal_signed * (invoice_type.sign)::numeric)) AS price_total,
            (sum(abs(ail.price_subtotal_signed)) /
                CASE
                    WHEN (sum(((ail.quantity / u.factor) * u2.factor)) <> (0)::numeric) THEN sum(((ail.quantity / u.factor) * u2.factor))
                    ELSE (1)::numeric
                END) AS price_average,
            (((ai.residual_company_signed / (( SELECT count(*) AS count
                   FROM public.account_invoice_line l
                  WHERE (l.invoice_id = ai.id)))::numeric) * (count(*))::numeric) * (invoice_type.sign)::numeric) AS residual,
            ai.commercial_partner_id,
            partner.country_id,
            sum((((pr.weight * ((invoice_type.sign)::numeric * ail.quantity)) / u.factor) * u2.factor)) AS weight,
            sum((((pr.volume * (((invoice_type.sign)::numeric * ail.quantity))::double precision) / (u.factor)::double precision) * (u2.factor)::double precision)) AS volume,
            ai.document_type_id,
            ai.team_id
           FROM (((((((public.account_invoice_line ail
             JOIN public.account_invoice ai ON ((ai.id = ail.invoice_id)))
             JOIN public.res_partner partner ON ((ai.commercial_partner_id = partner.id)))
             LEFT JOIN public.product_product pr ON ((pr.id = ail.product_id)))
             LEFT JOIN public.product_template pt ON ((pt.id = pr.product_tmpl_id)))
             LEFT JOIN public.product_uom u ON ((u.id = ail.uom_id)))
             LEFT JOIN public.product_uom u2 ON ((u2.id = pt.uom_id)))
             JOIN ( SELECT ai_1.id,
                        CASE
                            WHEN ((ai_1.type)::text = ANY (ARRAY[('in_refund'::character varying)::text, ('in_invoice'::character varying)::text])) THEN '-1'::integer
                            ELSE 1
                        END AS sign,
                        CASE
                            WHEN ((ai_1.type)::text = ANY (ARRAY[('out_refund'::character varying)::text, ('in_invoice'::character varying)::text])) THEN '-1'::integer
                            ELSE 1
                        END AS sign_qty
                   FROM public.account_invoice ai_1) invoice_type ON ((invoice_type.id = ai.id)))
          GROUP BY ail.id, ail.product_id, ail.account_analytic_id, ai.date_invoice, ai.id, ai.partner_id, ai.payment_term_id, u2.name, u2.id, ai.currency_id, ai.journal_id, ai.fiscal_position_id, ai.user_id, ai.company_id, ai.type, invoice_type.sign, ai.state, pt.categ_id, ai.date_due, ai.account_id, ail.account_id, ai.partner_bank_id, ai.residual_company_signed, ai.amount_total_company_signed, ai.commercial_partner_id, partner.country_id, ai.document_type_id, ai.team_id) sub
     LEFT JOIN currency_rate cr ON (((cr.currency_id = sub.currency_id) AND (cr.company_id = sub.company_id) AND (cr.date_start <= COALESCE((sub.date)::timestamp with time zone, now())) AND ((cr.date_end IS NULL) OR (cr.date_end > COALESCE((sub.date)::timestamp with time zone, now()))))));
