--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.4

-- Started on 2021-05-10 11:58:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;




SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.a7 (
    b7 integer NOT NULL,
    c7 integer NOT NULL
);

CREATE TABLE public.ab2_rel (
    a2_id integer NOT NULL,
    b2_id integer NOT NULL
);

CREATE TABLE public.ab3_rel (
    a3_id integer NOT NULL,
    b3_id integer NOT NULL
);


CREATE TABLE public.ab_rel (
    a_id integer NOT NULL,
    b_id integer NOT NULL
);

CREATE TABLE public.account_account (
    id integer ,
    create_uid integer,
    code character varying(64) ,
    create_date timestamp without time zone,
    reconcile boolean,
    deprecated boolean,
    company_id integer ,
    write_uid integer,
    currency_id integer,
    note text ,
    internal_type character varying ,
    write_date timestamp without time zone,
    user_type_id integer ,
    last_time_entries_checked timestamp without time zone,
    name character varying ,
    wtaxf character varying 
);

CREATE TABLE public.account_account_account_tag (
    account_account_id integer NOT NULL,
    account_account_tag_id integer NOT NULL
);

CREATE TABLE public.account_account_analytic_dimension (
    id integer NOT NULL,
    create_uid integer,
    account_id integer,
    analytic_dimension_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_account_financial_report (
    report_line_id integer NOT NULL,
    account_id integer NOT NULL
);

CREATE TABLE public.account_account_financial_report_type (
    report_id integer NOT NULL,
    account_type_id integer NOT NULL
);

CREATE TABLE public.account_account_tag (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    color integer,
    write_uid integer,
    applicability character varying NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_account_tag_account_tax_template_rel (
    account_tax_template_id integer NOT NULL,
    account_account_tag_id integer NOT NULL
);

CREATE TABLE public.account_account_tax_default_rel (
    account_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.account_account_template (
    id integer NOT NULL,
    create_uid integer,
    code character varying(64) NOT NULL,
    create_date timestamp without time zone,
    reconcile boolean,
    chart_template_id integer,
    write_uid integer,
    currency_id integer,
    note text,
    nocreate boolean,
    write_date timestamp without time zone,
    user_type_id integer NOT NULL,
    name character varying NOT NULL
);

CREATE TABLE public.account_account_template_account_tag (
    account_account_template_id integer NOT NULL,
    account_account_tag_id integer NOT NULL
);

CREATE TABLE public.account_account_template_tax_rel (
    account_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.account_account_type (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    note text,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    include_initial_balance boolean,
    type character varying NOT NULL
);

CREATE TABLE public.account_account_type_rel (
    journal_id integer NOT NULL,
    account_id integer NOT NULL
);

CREATE TABLE public.account_aged_trial_balance (
    id integer NOT NULL,
    create_uid integer,
    date_from date,
    period_length integer NOT NULL,
    result_selection character varying NOT NULL,
    company_id integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_aged_trial_balance_account_journal_rel (
    account_aged_trial_balance_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_analytic_account (
    id integer NOT NULL,
    code character varying,
    create_date timestamp without time zone,
    message_last_post timestamp without time zone,
    write_uid integer,
    partner_id integer,
    create_uid integer,
    company_id integer NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    name character varying NOT NULL
);

CREATE TABLE public.account_analytic_account_tag_rel (
    account_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_dimension (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_analytic_dimension_accounts (
    id integer NOT NULL,
    create_uid integer,
    account_id integer,
    analytic_dimension_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_analytic_line (
    id integer NOT NULL,
    create_uid integer,
    user_id integer,
    account_id integer NOT NULL,
    company_id integer,
    write_uid integer,
    amount numeric NOT NULL,
    unit_amount double precision,
    date date NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    partner_id integer,
    name character varying NOT NULL,
    code character varying(8),
    currency_id integer,
    ref character varying,
    general_account_id integer,
    move_id integer,
    product_id integer,
    product_uom_id integer,
    amount_currency numeric,
    so_line integer
);

CREATE TABLE public.account_analytic_line_tag_rel (
    line_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_tag (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    color integer,
    write_uid integer,
    write_date timestamp without time zone,
    analytic_dimension_id integer,
    code character varying,
    parent_tag_id integer,
    company_id integer,
    active boolean
);

CREATE TABLE public.account_analytic_tag_account_cash_inout_rel (
    account_cash_inout_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_tag_account_invoice_line_rel (
    account_invoice_line_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_tag_account_move_line_rel (
    account_move_line_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_tag_purchase_order_line_rel (
    purchase_order_line_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_analytic_tag_sale_order_line_rel (
    sale_order_line_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_balance_report (
    id integer NOT NULL,
    create_uid integer,
    date_from date,
    company_id integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    display_account character varying NOT NULL,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_balance_report_journal_rel (
    account_id integer NOT NULL,
    journal_id integer NOT NULL
);

CREATE TABLE public.account_bank_accounts_wizard (
    id integer NOT NULL,
    create_uid integer,
    account_type character varying,
    acc_name character varying NOT NULL,
    write_uid integer,
    currency_id integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    bank_account_id integer NOT NULL
);

CREATE TABLE public.account_bank_statement (
    id integer NOT NULL,
    create_date timestamp without time zone,
    date_done timestamp without time zone,
    balance_start numeric,
    journal_id integer NOT NULL,
    create_uid integer,
    user_id integer,
    reference character varying,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying NOT NULL,
    cashbox_start_id integer,
    cashbox_end_id integer,
    write_uid integer,
    total_entry_encoding numeric,
    write_date timestamp without time zone,
    date date NOT NULL,
    difference numeric,
    name character varying,
    balance_end numeric,
    balance_end_real numeric
);

CREATE TABLE public.account_bank_statement_cashbox (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_bank_statement_closebalance (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_bank_statement_import (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    data_file bytea NOT NULL,
    filename character varying,
    write_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_bank_statement_import_journal_creation (
    id integer NOT NULL,
    create_date timestamp without time zone,
    journal_id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_bank_statement_line (
    id integer NOT NULL,
    create_date timestamp without time zone,
    statement_id integer NOT NULL,
    sequence integer,
    journal_id integer,
    partner_id integer,
    create_uid integer,
    partner_name character varying,
    company_id integer,
    bank_account_id integer,
    note text,
    ref character varying,
    account_id integer,
    move_name character varying,
    write_date timestamp without time zone,
    date date NOT NULL,
    write_uid integer,
    currency_id integer,
    name character varying NOT NULL,
    amount numeric,
    amount_currency numeric,
    unique_import_id character varying
);

CREATE TABLE public.account_cash_inout (
    id integer NOT NULL,
    create_date timestamp without time zone,
    deposit_date date NOT NULL,
    receiptbook_id integer,
    journal_id integer NOT NULL,
    currency_id integer NOT NULL,
    create_uid integer,
    employee_id integer,
    company_id integer,
    paym_account_analytic_id integer,
    state character varying,
    benefitiary_id integer,
    type character varying,
    write_uid integer,
    cash_account_id integer NOT NULL,
    cash_account_analytic_id integer,
    sub_journal integer,
    write_date timestamp without time zone,
    benefitiary_type character varying,
    move_id integer,
    total_amount numeric,
    name character varying(64),
    cash_reference character varying
);

CREATE TABLE public.account_cashbox_line (
    id integer NOT NULL,
    create_uid integer,
    number integer,
    cashbox_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    coin_value numeric NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.account_change_check_third_wizard (
    id integer NOT NULL,
    payment_date date,
    issue_date date NOT NULL,
    owner_name integer,
    checkbook_id integer,
    create_uid integer,
    number integer NOT NULL,
    original_check_third_id integer NOT NULL,
    original_check_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    owner_vat character varying,
    bank_id integer
);

CREATE TABLE public.account_change_check_wizard (
    id integer NOT NULL,
    create_uid integer,
    issue_date date NOT NULL,
    owner_name integer,
    create_date timestamp without time zone,
    checkbook_id integer,
    payment_date date,
    original_check_id integer NOT NULL,
    number integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    owner_vat character varying,
    bank_id integer
);

CREATE TABLE public.account_change_check_wizard2 (
    id integer NOT NULL,
    original_check_id2 integer NOT NULL,
    create_uid integer,
    issue_date date NOT NULL,
    owner_name integer,
    create_date timestamp without time zone,
    checkbook_id integer,
    payment_date date,
    original_check_id integer NOT NULL,
    number integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    owner_vat character varying,
    bank_id integer
);

CREATE TABLE public.account_chart_template (
    id integer NOT NULL,
    bank_account_code_prefix character varying,
    cash_account_code_prefix character varying,
    create_date timestamp without time zone,
    write_uid integer,
    currency_id integer NOT NULL,
    visible boolean,
    property_account_receivable_id integer,
    property_stock_valuation_account_id integer,
    create_uid integer,
    complete_tax_set boolean,
    parent_id integer,
    transfer_account_id integer NOT NULL,
    company_id integer,
    expense_currency_exchange_account_id integer,
    property_stock_account_output_categ_id integer,
    property_account_income_categ_id integer,
    property_stock_account_input_categ_id integer,
    property_account_income_id integer,
    property_account_expense_categ_id integer,
    write_date timestamp without time zone,
    use_anglo_saxon boolean,
    code_digits integer NOT NULL,
    name character varying NOT NULL,
    property_account_expense_id integer,
    property_account_payable_id integer,
    income_currency_exchange_account_id integer,
    localization character varying,
    holding_check_account_id integer,
    rejected_check_account_id integer,
    deferred_check_account_id integer
);

CREATE TABLE public.account_check (
    id integer NOT NULL,
    create_date timestamp without time zone,
    checkbook_id integer,
    number character varying,
    journal_id integer NOT NULL,
    currency_id integer,
    partner_id integer,
    payment_date date,
    issue_date date NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying NOT NULL,
    supplier boolean,
    type character varying,
    owner_name integer,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    customer boolean,
    name character varying,
    notes text,
    bank_id integer,
    amount numeric,
    amount_currency numeric,
    amount_cash double precision,
    cashin_out_id integer,
    no_order boolean,
    new_third_id integer
);

CREATE TABLE public.account_check_deposit (
    id integer NOT NULL,
    create_date timestamp without time zone,
    deposit_date date NOT NULL,
    write_uid integer,
    currency_id integer NOT NULL,
    create_uid integer,
    company_id integer NOT NULL,
    state character varying,
    write_date timestamp without time zone,
    move_id integer,
    bank_journal_id integer NOT NULL,
    name character varying(64),
    journal_id integer NOT NULL
);

CREATE TABLE public.account_check_history (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    type character varying,
    date_from date NOT NULL,
    bank_id integer,
    write_uid integer,
    sort_order character varying,
    mode character varying,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.account_check_history_issue_checks_states_rel (
    account_check_history_id integer NOT NULL,
    issue_checks_states_id integer NOT NULL
);

CREATE TABLE public.account_check_history_res_partner_rel (
    account_check_history_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.account_check_history_third_checks_states_rel (
    account_check_history_id integer NOT NULL,
    third_checks_states_id integer NOT NULL
);

CREATE TABLE public.account_check_operation (
    id integer NOT NULL,
    origin character varying,
    create_uid integer,
    create_date timestamp without time zone,
    origin_name character varying,
    check_id integer NOT NULL,
    notes text,
    owner_model character varying,
    write_uid integer,
    write_date timestamp without time zone,
    transdate_move_id date,
    date timestamp without time zone NOT NULL,
    operation character varying NOT NULL,
    partner_id integer,
    move_id integer,
    owner_id integer
);

CREATE TABLE public.account_check_third (
    id integer NOT NULL,
    create_date timestamp without time zone,
    checkbook_id integer,
    number character varying,
    journal_id integer NOT NULL,
    currency_id integer,
    partner_id integer,
    payment_date date,
    issue_date date NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying NOT NULL,
    supplier boolean,
    type character varying,
    create_uid integer,
    no_order boolean,
    owner_name integer,
    write_uid integer,
    write_date timestamp without time zone,
    old_third_id integer,
    customer boolean,
    new_third_id integer,
    name character varying,
    notes text,
    bank_id integer,
    amount numeric,
    amount_currency numeric,
    amount_cash double precision,
    cashin_out_id integer
);

CREATE TABLE public.account_check_third_operation (
    id integer NOT NULL,
    origin character varying,
    create_uid integer,
    origin_name character varying,
    check_id integer,
    notes text,
    owner_model character varying,
    write_uid integer,
    check_third_id integer NOT NULL,
    write_date timestamp without time zone,
    transdate_move_id date,
    date timestamp without time zone NOT NULL,
    create_date timestamp without time zone,
    operation character varying NOT NULL,
    partner_id integer,
    move_id integer,
    owner_id integer
);

CREATE TABLE public.account_check_wizard (
    id integer NOT NULL,
    exp_account_id integer,
    create_date timestamp without time zone,
    account_id integer,
    create_uid integer,
    company_id integer NOT NULL,
    exp_type character varying,
    journal_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    action_type character varying NOT NULL,
    date date NOT NULL,
    exp_amount numeric,
    chk_type character varying
);

CREATE TABLE public.account_checkbook (
    id integer NOT NULL,
    issue_check_subtype character varying NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    range_to integer,
    debit_journal_id integer,
    journal_id integer NOT NULL,
    write_uid integer,
    sequence_id integer,
    state character varying,
    write_date timestamp without time zone
);

CREATE TABLE public.account_common_account_report (
    id integer NOT NULL,
    create_uid integer,
    date_from date,
    company_id integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    display_account character varying NOT NULL,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_common_account_report_account_journal_rel (
    account_common_account_report_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_common_journal_report (
    id integer NOT NULL,
    create_uid integer,
    company_id integer,
    date_from date,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    amount_currency boolean,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_common_journal_report_account_journal_rel (
    account_common_journal_report_id integer NOT NULL,
    account_journal_id integer NOT NULL
);


CREATE TABLE public.account_common_partner_report (
    id integer NOT NULL,
    create_uid integer,
    date_from date,
    result_selection character varying NOT NULL,
    company_id integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_common_partner_report_account_journal_rel (
    account_common_partner_report_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_common_report (
    id integer NOT NULL,
    create_uid integer,
    date_from date,
    company_id integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_common_report_account_journal_rel (
    account_common_report_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_config_settings (
    id integer NOT NULL,
    create_date timestamp without time zone,
    module_account_asset boolean,
    write_uid integer,
    module_account_accountant boolean,
    has_chart_of_accounts boolean,
    create_uid integer,
    complete_tax_set boolean,
    template_transfer_account_id integer,
    module_account_sepa boolean,
    module_account_bank_statement_import_csv boolean,
    module_account_budget boolean,
    company_id integer NOT NULL,
    group_warning_account integer,
    group_multi_currency boolean,
    group_proforma_invoices boolean,
    module_account_reports boolean,
    module_account_plaid boolean,
    has_default_company boolean,
    purchase_tax_rate double precision,
    module_account_bank_statement_import_ofx boolean,
    module_l10n_us_check_printing boolean,
    default_purchase_tax_id integer,
    write_date timestamp without time zone,
    sale_tax_rate double precision,
    module_account_batch_deposit boolean,
    module_account_yodlee boolean,
    module_account_tax_cash_basis boolean,
    chart_template_id integer,
    default_sale_tax_id integer,
    sale_tax_id integer,
    module_account_bank_statement_import_qif boolean,
    group_analytic_accounting boolean,
    module_account_deferred_revenue boolean,
    module_account_reports_followup boolean,
    purchase_tax_id integer,
    group_analytic_account_for_sales boolean,
    group_analytic_account_for_purchases boolean,
    sale_use_documents boolean,
    purchase_use_documents boolean,
    group_choose_payment_type boolean,
    point_of_sale_type character varying,
    point_of_sale_number integer,
    afip_ws character varying,
    default_acquirer integer
);

CREATE TABLE public.account_context_aged_payable (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_context_aged_receivable (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_context_coa (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_context_detail_general_ledger (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_filter_cmp character varying,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    account_manager_id integer NOT NULL,
    all_entries boolean,
    filter_unfold_all boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    balance character varying,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    new_filter_unfold_all boolean,
    initial_balance character varying
);

CREATE TABLE public.account_context_footnote_followup (
    account_report_context_followup_id integer NOT NULL,
    account_report_footnote_id integer NOT NULL
);

CREATE TABLE public.account_context_general_ledger (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    multicompany_manager_id integer NOT NULL,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    all_entries boolean,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_doc_let_responsability_issuer_rel (
    afip_responsability_type_id integer NOT NULL,
    letter_id integer NOT NULL
);

CREATE TABLE public.account_doc_let_responsability_receptor_rel (
    afip_responsability_type_id integer NOT NULL,
    letter_id integer NOT NULL
);

CREATE TABLE public.account_document_letter (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    taxes_included boolean,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.account_document_letter_responsability_issuer_rel (
    document_letter_id integer NOT NULL,
    afip_responsability_type_id integer NOT NULL
);

CREATE TABLE public.account_document_letter_responsability_receptor_rel (
    document_letter_id integer NOT NULL,
    afip_responsability_type_id integer NOT NULL
);

CREATE TABLE public.account_document_type (
    id integer NOT NULL,
    create_uid integer,
    internal_type character varying,
    name character varying NOT NULL,
    validator_id integer,
    localization character varying,
    sequence integer NOT NULL,
    company_id integer NOT NULL,
    doc_code_prefix character varying,
    report_name character varying,
    code character varying,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    write_uid integer,
    document_letter_id integer,
    mipymesf boolean,
    dont_show_duedate boolean
);

CREATE TABLE public.account_financial_html_report (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    debit_credit boolean,
    company_id integer,
    write_uid integer,
    menuitem_created boolean,
    create_date timestamp without time zone,
    parent_id integer,
    report_type character varying NOT NULL,
    write_date timestamp without time zone,
    tax_report boolean
);

CREATE TABLE public.account_financial_html_report_context (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    report_id integer,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_financial_html_report_line (
    id integer NOT NULL,
    code character varying,
    create_date timestamp without time zone,
    sequence integer,
    domain character varying,
    write_uid integer,
    special_date_changer character varying,
    create_uid integer,
    parent_id integer,
    financial_report_id integer,
    action_id integer,
    formulas character varying,
    figure_type character varying NOT NULL,
    green_on_positive boolean,
    write_date timestamp without time zone,
    name character varying,
    level integer NOT NULL,
    show_domain character varying,
    hide_if_zero boolean,
    groupby character varying
);

CREATE TABLE public.account_financial_report (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    sequence integer,
    level integer,
    style_overwrite integer,
    sign integer NOT NULL,
    parent_id integer,
    write_date timestamp without time zone,
    account_report_id integer,
    display_detail character varying,
    write_uid integer,
    type character varying
);

CREATE TABLE public.account_fiscal_position (
    id integer NOT NULL,
    create_date timestamp without time zone,
    zip_to integer,
    sequence integer,
    auto_apply boolean,
    write_uid integer,
    vat_required boolean,
    create_uid integer,
    country_id integer,
    company_id integer,
    note text,
    country_group_id integer,
    write_date timestamp without time zone,
    active boolean,
    name character varying NOT NULL,
    zip_from integer,
    afip_code character varying,
    afip_code_purch character varying
);

CREATE TABLE public.account_fiscal_position_account (
    id integer NOT NULL,
    create_uid integer,
    position_id integer NOT NULL,
    write_uid integer,
    account_dest_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    account_src_id integer NOT NULL
);

CREATE TABLE public.account_fiscal_position_account_template (
    id integer NOT NULL,
    create_uid integer,
    position_id integer NOT NULL,
    write_uid integer,
    account_dest_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    account_src_id integer NOT NULL
);

CREATE TABLE public.account_fiscal_position_res_country_state_rel (
    account_fiscal_position_id integer NOT NULL,
    res_country_state_id integer NOT NULL
);

CREATE TABLE public.account_fiscal_position_tax (
    id integer NOT NULL,
    create_uid integer,
    position_id integer NOT NULL,
    tax_src_id integer NOT NULL,
    write_uid integer,
    tax_dest_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_fiscal_position_tax_template (
    id integer NOT NULL,
    create_uid integer,
    position_id integer NOT NULL,
    tax_src_id integer NOT NULL,
    write_uid integer,
    tax_dest_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_fiscal_position_template (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    chart_template_id integer NOT NULL,
    write_uid integer,
    note text,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    country_group_id integer,
    country_id integer,
    auto_apply boolean,
    zip_to integer,
    zip_from integer,
    afip_code character varying
);

CREATE TABLE public.account_fiscal_position_template_res_country_state_rel (
    account_fiscal_position_template_id integer NOT NULL,
    res_country_state_id integer NOT NULL
);

CREATE TABLE public.account_followup_followup (
    id integer NOT NULL,
    create_uid integer,
    company_id integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_followup_followup_line (
    id integer NOT NULL,
    manual_action_note text,
    create_uid integer,
    description text,
    send_letter boolean,
    sequence integer,
    manual_action_responsible_id integer,
    write_uid integer,
    delay integer NOT NULL,
    send_email boolean,
    manual_action boolean,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    followup_id integer NOT NULL,
    name character varying NOT NULL
);

CREATE TABLE public.account_full_reconcile (
    id integer NOT NULL,
    create_uid integer,
    exchange_move_id integer,
    name character varying NOT NULL,
    exchange_partial_rec_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_fup_report_skipped_partners (
    account_report_context_followup_all_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.account_invoice (
    id integer ,
    comment text ,
    date_due date,
    create_date timestamp without time zone,
    partner_bank_id integer,
    "number" character varying ,
    journal_id integer ,
    amount_total_company_signed numeric,
    residual numeric,
    partner_id integer ,
    create_uid integer,
    amount_untaxed numeric,
    reference character varying ,
    residual_company_signed numeric,
    amount_total_signed numeric,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    amount_tax numeric,
    state character varying,
    move_id integer,
    type character varying,
    sent boolean,
    account_id integer ,
    reconciled boolean,
    origin character varying ,
    move_name character varying ,
    reference_type character varying ,
    date_invoice date,
    payment_term_id integer,
    write_date timestamp without time zone,
    residual_signed numeric,
    date date,
    user_id integer,
    write_uid integer,
    fiscal_position_id integer,
    amount_total numeric,
    amount_untaxed_signed numeric,
    currency_id integer ,
    refund_invoice_id integer,
    name character varying ,
    commercial_partner_id integer,
    partner_shipping_id integer,
    team_id integer,
    campaign_id integer,
    medium_id integer,
    source_id integer,
    purchase_id integer,
    incoterms_id integer,
    document_number character varying ,
    journal_document_type_id integer,
    display_name2 character varying ,
    document_type_id integer,
    nc_ref_id integer,
    afip_service_end date,
    afip_service_start date,
    afip_incoterm_id integer,
    afip_responsability_type_id integer,
    currency_rate numeric,
    afip_auth_code_due date,
    afip_result character varying ,
    afip_auth_mode character varying,
    afip_auth_verify_observation character varying ,
    afip_batch_number integer,
    afip_auth_verify_result character varying,
    afip_xml_request text ,
    afip_xml_response text ,
    afip_message text,
    afip_auth_code character varying(24) ,
    manual_currency_rate numeric,
    manual_currency_rate_active boolean,
    print_as_payment_mode boolean,
    state_id integer,
    woo_instance_id integer,
    is_refund_in_woo boolean,
    source_invoice_id integer,
    afip_error_log text ,
    cbu character varying ,
    revocation_code character varying,
    bank_account_id integer,
    comercial_ref character varying(50) ,
    acceptance character varying ,
    cbu_alias character varying ,
    mipymesf boolean,
    mipymesf_read_only boolean,
    acceptance_date date,
    cancel_date date,
    region_tax_control_id integer,
    date_est_payment date,
    journal_estimated_payment integer,
    email_sent boolean,
    trasnfer_opt_mipymes character varying 
);

CREATE TABLE public.account_invoice_account_move_line_rel (
    account_invoice_id integer NOT NULL,
    account_move_line_id integer NOT NULL
);

CREATE TABLE public.account_invoice_caerecover (
    id integer NOT NULL,
    create_uid integer,
    journal_id integer NOT NULL,
    number character varying(64),
    doctype_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_invoice_cancel (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_invoice_confirm (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_invoice_line (
    id integer ,
    origin character varying,
    create_date timestamp without time zone,
    price_unit numeric ,
    price_subtotal numeric,
    write_uid integer,
    currency_id integer,
    uom_id integer,
    partner_id integer,
    create_uid integer,
    sequence integer,
    company_id integer,
    account_analytic_id integer,
    account_id integer ,
    discount numeric,
    write_date timestamp without time zone,
    price_subtotal_signed numeric,
    name text ,
    product_id integer,
    invoice_id integer,
    quantity numeric ,
    layout_category_sequence integer,
    layout_category_id integer,
    purchase_line_id integer
);

CREATE TABLE public.account_invoice_line_tax (
    invoice_line_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.account_invoice_payment_rel (
    payment_id integer NOT NULL,
    invoice_id integer NOT NULL
);

CREATE TABLE public.account_invoice_refund (
    id integer NOT NULL,
    create_uid integer,
    filter_refund character varying NOT NULL,
    description character varying NOT NULL,
    write_uid integer,
    date_invoice date NOT NULL,
    write_date timestamp without time zone,
    date date,
    create_date timestamp without time zone,
    invoice_id integer,
    document_number character varying,
    journal_document_type_id integer,
    type character varying NOT NULL
);

CREATE TABLE public.product_product (
    id integer ,
    create_date timestamp without time zone,
    weight numeric,
    default_code character varying,
    product_tmpl_id integer,
    message_last_post timestamp without time zone,
    create_uid integer,
    write_uid integer,
    barcode character varying,
    volume double precision,
    write_date timestamp without time zone,
    active boolean,
    image_url character varying(600) 
);

CREATE TABLE public.product_template (
    id integer,
    warranty double precision,
    list_price numeric,
    weight numeric,
    sequence integer,
    color integer,
    write_uid integer,
    uom_id integer,
    description_purchase text,
    default_code character varying,
    create_date timestamp without time zone,
    create_uid integer,
    sale_ok boolean,
    purchase_ok boolean,
    message_last_post timestamp without time zone,
    company_id integer,
    uom_po_id integer,
    description_sale text,
    description text ,
    volume double precision,
    write_date timestamp without time zone,
    active boolean,
    categ_id integer,
    name character varying ,
    rental boolean,
    type character varying ,
    sale_line_warn character varying ,
    sale_line_warn_msg text,
    track_service character varying ,
    invoice_policy character varying ,
    expense_policy character varying ,
    tracking character varying ,
    location_id integer,
    description_picking text,
    warehouse_id integer,
    sale_delay double precision,
    can_be_expensed boolean,
    purchase_line_warn_msg text ,
    purchase_method character varying,
    purchase_line_warn character varying ,
    use_time integer,
    life_time integer,
    removal_time integer,
    alert_time integer,
    produce_delay double precision,
    landed_cost_ok boolean,
    split_method character varying,
    website_description text ,
    hs_code character varying ,
    tc_state character varying ,
    oc_state character varying ,
    secretaria_code character varying(64),
    mercosur_code character varying(64) ,
    product_brand_id integer,
    pack_cat integer,
    flavor_id integer,
    quote_description text 
);

CREATE TABLE public.product_uom (
    id integer,
    create_uid integer,
    name character varying,
    rounding numeric,
    write_uid integer,
    uom_type character varying ,
    write_date timestamp without time zone,
    factor numeric ,
    active boolean,
    create_date timestamp without time zone,
    category_id integer ,
    afip_code character varying 
);

CREATE TABLE public.res_company (
    id integer NOT NULL,
    name character varying NOT NULL,
    partner_id integer NOT NULL,
    currency_id integer NOT NULL,
    rml_footer text,
    create_date timestamp without time zone,
    rml_header text NOT NULL,
    sequence integer,
    rml_paper_format character varying NOT NULL,
    write_uid integer,
    logo_web bytea,
    font integer,
    account_no character varying,
    parent_id integer,
    email character varying,
    create_uid integer,
    custom_footer boolean,
    phone character varying,
    rml_header2 text NOT NULL,
    rml_header3 text NOT NULL,
    write_date timestamp without time zone,
    rml_header1 character varying,
    company_registry character varying,
    paperformat_id integer,
    fiscalyear_lock_date date,
    bank_account_code_prefix character varying,
    cash_account_code_prefix character varying,
    anglo_saxon_accounting boolean,
    fiscalyear_last_day integer NOT NULL,
    expects_chart_of_accounts boolean,
    property_stock_valuation_account_id integer,
    property_stock_account_output_categ_id integer,
    transfer_account_id integer,
    currency_exchange_journal_id integer,
    period_lock_date date,
    tax_calculation_rounding_method character varying,
    accounts_code_digits integer,
    chart_template_id integer,
    overdue_msg text,
    fiscalyear_last_month integer NOT NULL,
    property_stock_account_input_categ_id integer,
    days_between_two_followups integer,
    currency_interval_unit character varying,
    currency_provider character varying,
    currency_next_execution_date date,
    sale_note text,
    propagation_minimum_delta integer,
    internal_transit_location_id integer,
    po_lead double precision NOT NULL,
    po_double_validation_amount numeric,
    po_lock character varying,
    po_double_validation character varying,
    security_lead double precision NOT NULL,
    localization character varying,
    val2words_default integer,
    third_party_checks_bounced_endorsed_account_id integer,
    third_party_checks_cancelled_account_id integer,
    payment_method_validate_jr boolean,
    own_check_rejected_account_id integer,
    holding_check_account_id integer,
    own_check_cancelled_account_id integer,
    deferred_check_account_id integer,
    rejected_check_account_id integer,
    check_deposit_offsetting_account character varying,
    check_deposit_transfer_account_id integer,
    arg_sortdate boolean,
    double_validation boolean,
    afip_auth_verify_type character varying NOT NULL,
    arba_cit character varying,
    automatic_withholdings boolean,
    manufacturing_lead double precision NOT NULL,
    agip_password character varying,
    agip_user character varying,
    agip_enabler boolean,
    analytic_tags_to_rows boolean,
    min_days_between_followup integer,
    permanent_lock_date date
);

CREATE TABLE public.res_currency_rate (
    id integer NOT NULL,
    create_uid integer,
    name timestamp without time zone NOT NULL,
    company_id integer,
    write_uid integer,
    currency_id integer,
    rate numeric,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    inverse_rate numeric
);

CREATE TABLE public.res_partner (
    id integer,
    name character varying,
    company_id integer,
    comment text ,
    website character varying ,
    create_date timestamp without time zone,
    color integer,
    active boolean,
    street character varying ,
    supplier boolean,
    city character varying ,
    display_name character varying ,
    zip character varying,
    title integer,
    country_id integer,
    commercial_company_name character varying ,
    parent_id integer,
    company_name character varying ,
    employee boolean,
    ref character varying ,
    email character varying ,
    is_company boolean,
    function character varying,
    lang character varying ,
    fax character varying,
    street2 character varying ,
    barcode character varying ,
    phone character varying ,
    write_date timestamp without time zone,
    date date,
    tz character varying ,
    write_uid integer,
    customer boolean,
    create_uid integer,
    credit_limit double precision,
    user_id integer,
    mobile character varying ,
    type character varying ,
    partner_share boolean,
    vat character varying ,
    state_id integer,
    commercial_partner_id integer,
    notify_email character varying ,
    message_last_post timestamp without time zone,
    opt_out boolean,
    message_bounce integer,
    signup_type character varying,
    signup_expiration timestamp without time zone,
    signup_token character varying ,
    team_id integer,
    debit_limit numeric,
    last_time_entries_checked timestamp without time zone,
    invoice_warn_msg text ,
    invoice_warn character varying ,
    calendar_last_notif_ack timestamp without time zone,
    sale_warn_msg text ,
    sale_warn character varying ,
    picking_warn character varying ,
    picking_warn_msg text ,
    purchase_warn character varying ,
    purchase_warn_msg text ,
    main_id_number character varying,
    main_id_category_id integer,
    gross_income_type character varying ,
    afip_responsability_type_id integer,
    gross_income_number character varying(64),
    start_date date,
    imp_ganancias_padron character varying ,
    actividad_monotributo_padron character varying ,
    integrante_soc_padron character varying ,
    last_update_padron date,
    estado_padron character varying,
    monotributo_padron character varying ,
    imp_iva_padron character varying ,
    empleador_padron boolean,
    employee_id integer,
    drei character varying ,
    transport_id integer,
    contact_person character varying(50) ,
    woo_customer_id character varying,
    woo_company_name_ept character varying ,
    email_collections text ,
    apg_warn character varying ,
    apg_warn_msg text ,
    market_id integer,
    sale_quote_template_id integer,
    sale_discount numeric
);

CREATE TABLE public.account_invoice_tax (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    account_id integer NOT NULL,
    name character varying NOT NULL,
    sequence integer,
    invoice_id integer,
    manual boolean,
    company_id integer,
    write_uid integer,
    currency_id integer,
    amount numeric,
    write_date timestamp without time zone,
    account_analytic_id integer,
    tax_id integer
);

CREATE TABLE public.account_invoice_tax_wizard (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    invoice_id integer,
    write_uid integer,
    amount numeric NOT NULL,
    base numeric NOT NULL,
    write_date timestamp without time zone,
    account_analytic_id integer,
    create_date timestamp without time zone,
    tax_id integer NOT NULL
);

CREATE TABLE public.account_journal (
    id integer NOT NULL,
    code character varying(5) NOT NULL,
    create_date timestamp without time zone,
    sequence integer,
    write_uid integer,
    currency_id integer,
    at_least_one_inbound boolean,
    bank_statements_source character varying,
    bank_account_id integer,
    create_uid integer,
    group_invoice_lines boolean,
    company_id integer NOT NULL,
    profit_account_id integer,
    display_on_footer boolean,
    default_debit_account_id integer,
    show_on_dashboard boolean,
    default_credit_account_id integer,
    sequence_id integer NOT NULL,
    write_date timestamp without time zone,
    refund_sequence_id integer,
    loss_account_id integer,
    update_posted boolean,
    name character varying NOT NULL,
    type character varying NOT NULL,
    at_least_one_outbound boolean,
    refund_sequence boolean,
    document_sequence_type character varying NOT NULL,
    use_documents boolean,
    point_of_sale_type character varying NOT NULL,
    point_of_sale_number integer,
    afip_ws character varying,
    sub_journal integer,
    journal_lock_date_future date,
    journal_lock_date date
);

CREATE TABLE public.account_journal_account_print_journal_rel (
    account_print_journal_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_journal_account_report_partner_ledger_rel (
    account_report_partner_ledger_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_journal_accounting_report_rel (
    accounting_report_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_journal_document_type (
    id integer NOT NULL,
    create_uid integer,
    sequence integer,
    journal_id integer NOT NULL,
    document_type_id integer NOT NULL,
    write_uid integer,
    sequence_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_journal_inbound_payment_method_rel (
    journal_id integer NOT NULL,
    inbound_payment_method integer NOT NULL
);

CREATE TABLE public.account_journal_lock (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    lock_date date
);

CREATE TABLE public.account_journal_outbound_payment_method_rel (
    journal_id integer NOT NULL,
    outbound_payment_method integer NOT NULL
);

CREATE TABLE public.account_journal_type_rel (
    journal_id integer NOT NULL,
    type_id integer NOT NULL
);

CREATE TABLE public.account_journal_vitt_sales_reports_reportvat_rel (
    vitt_sales_reports_reportvat_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_journal_vitt_sales_reports_reportvatpl_rel (
    vitt_sales_reports_reportvatpl_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_move (
    id integer NOT NULL,
    create_date timestamp without time zone,
    statement_line_id integer,
    create_uid integer,
    company_id integer,
    ref character varying,
    journal_id integer NOT NULL,
    write_uid integer,
    currency_id integer,
    amount numeric,
    state character varying NOT NULL,
    matched_percentage numeric,
    write_date timestamp without time zone,
    narration text,
    date date NOT NULL,
    partner_id integer,
    name character varying NOT NULL,
    display_name character varying,
    document_number character varying,
    document_type_id integer,
    origin_document character varying(255),
    type_document character varying,
    document_id integer
);

CREATE TABLE public.account_move_line (
    id integer NOT NULL,
    create_date timestamp without time zone,
    statement_id integer,
    journal_id integer,
    currency_id integer,
    date_maturity date NOT NULL,
    user_type_id integer,
    partner_id integer,
    blocked boolean,
    analytic_account_id integer,
    create_uid integer,
    amount_residual numeric,
    company_id integer,
    credit_cash_basis numeric,
    amount_residual_currency numeric,
    debit numeric,
    ref character varying,
    account_id integer NOT NULL,
    debit_cash_basis numeric,
    reconciled boolean,
    tax_exigible boolean,
    balance_cash_basis numeric,
    write_date timestamp without time zone,
    date date,
    write_uid integer,
    move_id integer NOT NULL,
    product_id integer,
    payment_id integer,
    company_currency_id integer,
    name character varying NOT NULL,
    invoice_id integer,
    full_reconcile_id integer,
    tax_line_id integer,
    credit numeric,
    product_uom_id integer,
    amount_currency numeric,
    balance numeric,
    quantity numeric,
    expected_pay_date date,
    internal_note text,
    next_action_date date,
    check_amount numeric,
    check_deposit_id integer,
    check_id integer,
    check_state character varying,
    check_issue_date date,
    check_payment_date date,
    bank_id integer,
    followup_date date,
    followup_line_id integer,
    CONSTRAINT account_move_line_credit_debit1 CHECK (((credit * debit) = (0)::numeric)),
    CONSTRAINT account_move_line_credit_debit2 CHECK (((credit + debit) >= (0)::numeric))
);

CREATE TABLE public.account_move_line_account_tax_rel (
    account_move_line_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_move_line_payment_group_to_pay_rel (
    payment_group_id integer NOT NULL,
    to_pay_line_id integer NOT NULL
);

CREATE TABLE public.account_move_line_reconcile (
    id integer NOT NULL,
    create_uid integer,
    writeoff numeric,
    company_id integer NOT NULL,
    write_uid integer,
    credit numeric,
    write_date timestamp without time zone,
    debit numeric,
    trans_nbr integer,
    create_date timestamp without time zone
);

CREATE TABLE public.account_move_line_reconcile_writeoff (
    id integer NOT NULL,
    comment character varying NOT NULL,
    create_uid integer,
    writeoff_acc_id integer NOT NULL,
    journal_id integer NOT NULL,
    analytic_id integer,
    write_date timestamp without time zone,
    date_p date,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_move_reversal (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    journal_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    date date NOT NULL
);

CREATE TABLE public.account_partial_reconcile (
    id integer NOT NULL,
    create_uid integer,
    credit_move_id integer NOT NULL,
    currency_id integer,
    full_reconcile_id integer,
    company_id integer,
    write_uid integer,
    amount numeric,
    debit_move_id integer NOT NULL,
    write_date timestamp without time zone,
    amount_currency numeric,
    create_date timestamp without time zone
);

CREATE TABLE public.account_partner_ledger_context (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    account_type character varying,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_payment (
    id integer NOT NULL,
    create_date timestamp without time zone,
    communication character varying,
    journal_id integer NOT NULL,
    currency_id integer NOT NULL,
    partner_id integer,
    payment_method_id integer NOT NULL,
    payment_date date NOT NULL,
    payment_difference_handling character varying,
    company_id integer,
    state character varying,
    writeoff_account_id integer,
    create_uid integer,
    move_name character varying,
    partner_type character varying,
    write_date timestamp without time zone,
    write_uid integer,
    name character varying,
    destination_journal_id integer,
    amount numeric NOT NULL,
    payment_type character varying NOT NULL,
    payment_reference character varying,
    payment_transaction_id integer,
    payment_token_id integer,
    receiptbook_id integer,
    document_number character varying,
    readonly_amount2 numeric,
    inbound boolean,
    outbound boolean,
    check_owner_name character varying,
    check_ids integer,
    checkbook_id integer,
    check_id integer,
    check_bank_id integer,
    check_name integer,
    check_issue_date date,
    check_owner_vat character varying,
    check_payment_date date,
    check_number integer,
    payment_group_id integer,
    withholding_base_amount numeric,
    withholding_number character varying,
    wh_perc numeric,
    customerbill integer,
    tax_withholding_id integer,
    sub_journal integer,
    withholdable_advanced_amount double precision,
    withholding_non_taxable_minimum double precision,
    period_withholding_amount double precision,
    accumulated_amount double precision,
    previous_withholding_amount double precision,
    withholdable_invoiced_amount double precision,
    computed_withholding_amount double precision,
    total_amount double precision,
    withholding_non_taxable_amount double precision,
    wiz_rel integer,
    withholdable_base_amount double precision,
    vendorbill integer,
    automatic boolean,
    manual_currency_rate_active boolean,
    manual_currency_rate numeric,
    manual boolean,
    no_order boolean,
    withholdable_invoiced_amount2 double precision,
    check_third_id integer,
    check_name2 integer
);

CREATE TABLE public.account_payment_group (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    currency_id integer,
    novatperc boolean,
    unreconciled_amount numeric,
    partner_id integer NOT NULL,
    payment_date date NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    state character varying,
    communication character varying,
    create_uid integer,
    partner_type character varying,
    write_date timestamp without time zone,
    has_paym_lines boolean,
    selected_finacial_debt numeric,
    notes text,
    to_pay_amount numeric,
    payment_date2 date,
    document_number character varying,
    display_name2 character varying,
    receiptbook_id integer,
    name character varying,
    retencion_ganancias character varying,
    manual_currency_rate_active boolean,
    manual_currency_rate numeric,
    currency_rate numeric,
    savedf boolean,
    tot_in_currency numeric,
    currency2_id integer,
    edit_billing_users boolean,
    prepayment_reference character varying,
    unmatched_amount2 double precision,
    CONSTRAINT account_payment_group_positive_rate CHECK ((manual_currency_rate >= (0)::numeric))
);

CREATE TABLE public.account_payment_group_confirm (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.account_payment_group_invoice_wizard (
    id integer NOT NULL,
    date_invoice date NOT NULL,
    description character varying,
    payment_group_id integer NOT NULL,
    create_uid integer,
    journal_id integer NOT NULL,
    write_uid integer,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    date date,
    create_date timestamp without time zone,
    product_id integer NOT NULL,
    document_number character varying,
    journal_document_type_id integer
);

CREATE TABLE public.account_payment_group_maint (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.account_payment_group_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_payment_method (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    payment_type character varying NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_payment_receiptbook (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying(64) NOT NULL,
    sequence integer,
    company_id integer NOT NULL,
    sequence_id integer,
    document_type_id integer NOT NULL,
    write_uid integer,
    padding integer,
    partner_type character varying NOT NULL,
    prefix character varying,
    write_date timestamp without time zone,
    active boolean,
    sequence_type character varying
);

CREATE TABLE public.account_payment_term (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    company_id integer NOT NULL,
    write_uid integer,
    note text,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    active boolean
);

CREATE TABLE public.account_payment_term_line (
    id integer NOT NULL,
    payment_id integer NOT NULL,
    create_uid integer,
    option character varying NOT NULL,
    sequence integer,
    days integer NOT NULL,
    value character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    value_amount numeric
);

CREATE TABLE public.account_print_journal (
    id integer NOT NULL,
    create_uid integer,
    sort_selection character varying NOT NULL,
    company_id integer,
    date_from date,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    amount_currency boolean,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_reconcile_model (
    id integer NOT NULL,
    second_analytic_account_id integer,
    create_date timestamp without time zone,
    sequence integer NOT NULL,
    second_amount_type character varying NOT NULL,
    second_journal_id integer,
    journal_id integer,
    analytic_account_id integer,
    create_uid integer,
    has_second_line boolean,
    company_id integer NOT NULL,
    label character varying,
    second_label character varying,
    second_account_id integer,
    account_id integer,
    write_date timestamp without time zone,
    write_uid integer,
    tax_id integer,
    amount_type character varying NOT NULL,
    name character varying NOT NULL,
    second_tax_id integer,
    amount numeric NOT NULL,
    second_amount numeric NOT NULL
);

CREATE TABLE public.account_reconcile_model_template (
    id integer NOT NULL,
    amount_type character varying NOT NULL,
    second_account_id integer,
    create_date timestamp without time zone,
    account_id integer,
    name character varying NOT NULL,
    sequence integer NOT NULL,
    second_amount_type character varying NOT NULL,
    has_second_line boolean,
    second_tax_id integer,
    write_uid integer,
    second_label character varying,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    create_uid integer,
    second_amount numeric NOT NULL,
    label character varying,
    tax_id integer
);

CREATE TABLE public.account_register_payments (
    id integer NOT NULL,
    create_uid integer,
    payment_date date NOT NULL,
    create_date timestamp without time zone,
    partner_type character varying,
    communication character varying,
    journal_id integer NOT NULL,
    write_uid integer,
    currency_id integer NOT NULL,
    amount numeric NOT NULL,
    payment_type character varying NOT NULL,
    write_date timestamp without time zone,
    partner_id integer,
    payment_method_id integer NOT NULL
);

CREATE TABLE public.account_report_account_manager (
    id integer NOT NULL,
    create_uid integer,
    account_range character varying,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_report_analytic_manager (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    analytic_account_dimension_id integer,
    account_include character varying,
    tag_include character varying
);

CREATE TABLE public.account_report_context_account_rel (
    account_report_account_manager_id integer NOT NULL,
    account_account_id integer NOT NULL
);

CREATE TABLE public.account_report_context_account_type_rel (
    account_report_account_manager_id integer NOT NULL,
    account_account_type_id integer NOT NULL
);

CREATE TABLE public.account_report_context_analytic_account_rel (
    account_report_analytic_manager_id integer NOT NULL,
    account_analytic_account_id integer NOT NULL
);

CREATE TABLE public.account_report_context_analytic_tag_rel (
    account_report_analytic_manager_id integer NOT NULL,
    account_analytic_tag_id integer NOT NULL
);

CREATE TABLE public.account_report_context_available_company (
    account_report_multicompany_manager_id integer NOT NULL,
    res_company_id integer NOT NULL
);

CREATE TABLE public.account_report_context_bank_rec (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    journal_id integer,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_report_context_common (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_report_context_company (
    account_report_multicompany_manager_id integer NOT NULL,
    res_company_id integer NOT NULL
);

CREATE TABLE public.account_report_context_followup (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    partner_id integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying,
    level integer
);

CREATE TABLE public.account_report_context_followup_all (
    id integer NOT NULL,
    create_uid integer,
    started timestamp without time zone,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    valuenow integer,
    partner_filter character varying,
    valuemax integer
);

CREATE TABLE public.account_report_context_tax (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.account_report_dgl_available_journal (
    account_context_detail_general_ledger_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_report_dgl_journals (
    account_context_detail_general_ledger_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_report_footnote (
    id integer NOT NULL,
    create_uid integer,
    "column" integer,
    text character varying,
    target_id integer,
    number integer,
    write_uid integer,
    manager_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    type character varying
);

CREATE TABLE public.account_report_footnotes_manager (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.account_report_general_ledger (
    id integer NOT NULL,
    create_uid integer,
    initial_balance boolean,
    date_from date,
    company_id integer,
    sortby character varying NOT NULL,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    write_uid integer,
    display_account character varying NOT NULL,
    target_move character varying NOT NULL
);

CREATE TABLE public.account_report_general_ledger_journal_rel (
    account_id integer NOT NULL,
    journal_id integer NOT NULL
);

CREATE TABLE public.account_report_gl_available_journal (
    account_context_general_ledger_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_report_gl_journals (
    account_context_general_ledger_id integer NOT NULL,
    account_journal_id integer NOT NULL
);

CREATE TABLE public.account_report_multicompany_manager (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.account_report_partner_ledger (
    id integer NOT NULL,
    create_uid integer,
    company_id integer,
    reconciled boolean,
    result_selection character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date,
    create_date timestamp without time zone,
    amount_currency boolean,
    target_move character varying NOT NULL,
    date_from date
);

CREATE TABLE public.account_report_tag_ilike (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    text text,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.account_report_type (
    id integer NOT NULL,
    comparison boolean,
    cash_basis boolean,
    extra_options boolean,
    write_uid integer,
    date_range boolean,
    analytic boolean,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    create_uid integer,
    account boolean,
    balance boolean,
    dimension boolean
);

CREATE TABLE public.account_tax (
    id integer NOT NULL,
    create_date timestamp without time zone,
    sequence integer NOT NULL,
    write_uid integer,
    include_base_amount boolean,
    account_id integer,
    create_uid integer,
    company_id integer NOT NULL,
    analytic boolean,
    description character varying,
    tax_adjustment boolean,
    type_tax_use character varying NOT NULL,
    refund_account_id integer,
    write_date timestamp without time zone,
    active boolean,
    amount_type character varying NOT NULL,
    name character varying NOT NULL,
    tax_group_id integer NOT NULL,
    amount numeric,
    price_include boolean,
    journal_id integer,
    min_retention_amount numeric,
    sequence_id integer,
    withholding_user_error_domain character varying,
    withholding_non_taxable_minimum numeric,
    withholding_non_taxable_amount numeric,
    withholding_advances boolean,
    withholding_amount_type character varying,
    reg_gan_id integer,
    withholding_accumulated_payments character varying,
    withholding_user_error_message character varying,
    withholding_type character varying NOT NULL,
    withholding_python_compute text,
    sicore_tax_code integer,
    jurisdiction_code integer,
    type character varying,
    vatreport_included boolean,
    regcode character varying(3),
    tax_control character varying,
    sicore_norm integer
);

CREATE TABLE public.account_tax_account_tag (
    account_tax_id integer NOT NULL,
    account_account_tag_id integer NOT NULL
);

CREATE TABLE public.account_tax_account_voucher_line_rel (
    account_voucher_line_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_arba_report_wizard_rel (
    arba_report_wizard_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_filiation_rel (
    parent_tax integer NOT NULL,
    child_tax integer NOT NULL
);

CREATE TABLE public.account_tax_group (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    sequence integer,
    write_uid integer,
    write_date timestamp without time zone,
    tax character varying,
    application character varying,
    afip_code integer,
    type character varying
);

CREATE TABLE public.account_tax_purchase_order_line_rel (
    purchase_order_line_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_res_company_rel (
    res_company_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_sale_advance_payment_inv_rel (
    sale_advance_payment_inv_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_sale_order_line_rel (
    sale_order_line_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_template (
    id integer NOT NULL,
    create_date timestamp without time zone,
    sequence integer NOT NULL,
    write_uid integer,
    include_base_amount boolean,
    account_id integer,
    create_uid integer,
    company_id integer NOT NULL,
    analytic boolean,
    description character varying,
    tax_adjustment boolean,
    type_tax_use character varying NOT NULL,
    refund_account_id integer,
    write_date timestamp without time zone,
    active boolean,
    amount_type character varying NOT NULL,
    name character varying NOT NULL,
    tax_group_id integer,
    chart_template_id integer NOT NULL,
    amount numeric NOT NULL,
    price_include boolean
);

CREATE TABLE public.account_tax_template_filiation_rel (
    parent_tax integer NOT NULL,
    child_tax integer NOT NULL
);

CREATE TABLE public.account_tax_vitt_sales_reports_reportsifere_rel (
    vitt_sales_reports_reportsifere_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_vitt_sales_reports_reportsifere_vtas_rel (
    vitt_sales_reports_reportsifere_vtas_id integer NOT NULL,
    account_tax_id integer NOT NULL
);

CREATE TABLE public.account_tax_withholding_rule (
    id integer NOT NULL,
    create_uid integer,
    domain character varying NOT NULL,
    sequence integer,
    fix_amount numeric,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    percentage numeric,
    tax_withholding_id integer NOT NULL
);

CREATE TABLE public.account_unreconcile (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.account_voucher (
    id integer NOT NULL,
    date_due date,
    create_date timestamp without time zone,
    reference character varying,
    number character varying,
    journal_id integer NOT NULL,
    narration text,
    partner_id integer,
    account_date date,
    create_uid integer,
    pay_now character varying,
    message_last_post timestamp without time zone,
    state character varying,
    tax_correction numeric,
    account_id integer NOT NULL,
    voucher_type character varying,
    write_date timestamp without time zone,
    date date,
    write_uid integer,
    move_id integer,
    tax_amount numeric,
    name character varying,
    amount numeric
);

CREATE TABLE public.account_voucher_line (
    id integer NOT NULL,
    create_uid integer,
    voucher_id integer NOT NULL,
    account_id integer NOT NULL,
    sequence integer,
    price_unit numeric NOT NULL,
    price_subtotal numeric,
    company_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    product_id integer,
    write_date timestamp without time zone,
    account_analytic_id integer,
    quantity numeric NOT NULL,
    name text NOT NULL
);

CREATE TABLE public.account_withholding_automatic_wizard (
    id integer NOT NULL,
    city character varying,
    write_date timestamp without time zone,
    create_uid integer,
    fix_amount double precision,
    percent numeric,
    write_uid integer,
    create_date timestamp without time zone,
    action_type character varying NOT NULL,
    state_id integer,
    tax_withholding_id integer NOT NULL
);

CREATE TABLE public.accounting_report (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    company_id integer,
    filter_cmp character varying NOT NULL,
    date_from date,
    enable_filter boolean,
    date_to_cmp date,
    write_uid integer,
    date_from_cmp date,
    label_filter character varying,
    debit_credit boolean,
    write_date timestamp without time zone,
    date_to date,
    account_report_id integer NOT NULL,
    target_move character varying NOT NULL
);

CREATE TABLE public.afip_activity (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.afip_concept (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.afip_incoterm (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    afip_code character varying NOT NULL,
    write_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.afip_reponsbility_account_fiscal_pos_rel (
    position_id integer NOT NULL,
    responsability_id integer NOT NULL
);

CREATE TABLE public.afip_reponsbility_account_fiscal_pos_temp_rel (
    position_id integer NOT NULL,
    responsability_id integer NOT NULL
);

CREATE TABLE public.afip_responsability_type (
    id integer NOT NULL,
    create_uid integer,
    code character varying(8) NOT NULL,
    name character varying(64) NOT NULL,
    sequence integer,
    report_code_name character varying(8),
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    arciba_resp_code character varying(1)
);

CREATE TABLE public.afip_tab_rel (
    tab_1 integer NOT NULL,
    afip_1 integer NOT NULL
);

CREATE TABLE public.afip_tabla_ganancias_alicuotasymontos (
    id integer NOT NULL,
    codigo_de_regimen character varying(5) NOT NULL,
    create_uid integer,
    anexo_referencia character varying NOT NULL,
    porcentaje_inscripto double precision,
    write_uid integer,
    concepto_referencia text NOT NULL,
    write_date timestamp without time zone,
    porcentaje_no_inscripto double precision,
    create_date timestamp without time zone,
    montos_no_sujetos_a_retencion double precision
);

CREATE TABLE public.afip_tabla_ganancias_escala (
    id integer NOT NULL,
    create_uid integer,
    importe_excedente double precision,
    importe_fijo double precision,
    porcentaje double precision,
    write_date timestamp without time zone,
    importe_hasta double precision,
    create_date timestamp without time zone,
    write_uid integer,
    importe_desde double precision
);

CREATE TABLE public.afip_tax (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.afip_ws_consult_wizard (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    number integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.afip_ws_currency_rate_wizard (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    currency_id integer NOT NULL,
    write_date timestamp without time zone
);

CREATE TABLE public.afip_wsfe_error (
    id integer NOT NULL,
    create_uid integer,
    code character varying(2),
    description text,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    name character varying(64)
);

CREATE TABLE public.afipws_certificate (
    id integer NOT NULL,
    create_uid integer,
    crt text,
    alias_id integer NOT NULL,
    write_uid integer,
    state character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    csr text
);

CREATE TABLE public.afipws_certificate_alias (
    id integer NOT NULL,
    city character varying NOT NULL,
    service_type character varying NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    company_cuit character varying(16),
    create_uid integer,
    common_name character varying(64) NOT NULL,
    country_id integer NOT NULL,
    company_id integer NOT NULL,
    write_uid integer,
    department character varying NOT NULL,
    state character varying,
    key text,
    state_id integer,
    service_provider_cuit character varying(16),
    type character varying NOT NULL
);

CREATE TABLE public.afipws_connection (
    id integer NOT NULL,
    afip_ws character varying NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    create_date timestamp without time zone,
    company_id integer NOT NULL,
    sign text,
    batch_sequence_id integer,
    token text,
    uniqueid character varying,
    expirationtime timestamp without time zone,
    generationtime timestamp without time zone,
    type character varying NOT NULL
);

CREATE TABLE public.afipws_upload_certificate_wizard (
    id integer NOT NULL,
    create_uid integer,
    certificate_id integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    certificate_file bytea NOT NULL
);

CREATE TABLE public.aged_payable_context_to_partner (
    account_context_aged_payable_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.aged_receivable_context_to_partner (
    account_context_aged_receivable_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.arba_report_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    wh_code integer,
    date_from date NOT NULL,
    percep boolean,
    wh boolean,
    oper_type character varying,
    percep_code integer,
    date_to date NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    fortnight boolean
);

CREATE TABLE public.arciba2_report_wizard (
    id integer NOT NULL,
    create_uid integer,
    date_from date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.arciba2_report_wizard_jurisdiction_codes_rel (
    arciba2_report_wizard_id integer NOT NULL,
    jurisdiction_codes_id integer NOT NULL
);

CREATE TABLE public.arciba_report_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    wh_code integer,
    date_from date NOT NULL,
    write_uid integer,
    do_percep boolean,
    do_wh boolean,
    percep_code integer,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.barcode_nomenclature (
    id integer NOT NULL,
    create_uid integer,
    name character varying(32) NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    upc_ean_conv character varying NOT NULL
);

CREATE TABLE public.barcode_rule (
    id integer NOT NULL,
    create_uid integer,
    name character varying(32) NOT NULL,
    encoding character varying NOT NULL,
    pattern character varying(32) NOT NULL,
    sequence integer,
    write_uid integer,
    alias character varying(32) NOT NULL,
    write_date timestamp without time zone,
    barcode_nomenclature_id integer,
    create_date timestamp without time zone,
    type character varying NOT NULL
);

CREATE TABLE public.base_action_rule (
    id integer NOT NULL,
    create_date timestamp without time zone,
    filter_pre_id integer,
    sequence integer,
    write_uid integer,
    trg_date_range_type character varying,
    trg_date_range integer,
    create_uid integer,
    filter_pre_domain character varying,
    on_change_fields character varying,
    filter_id integer,
    model_id integer NOT NULL,
    trg_date_id integer,
    write_date timestamp without time zone,
    active boolean,
    kind character varying NOT NULL,
    filter_domain character varying,
    name character varying NOT NULL,
    act_user_id integer,
    last_run timestamp without time zone,
    trg_date_calendar_id integer,
    trg_date_resource_field_id integer
);

CREATE TABLE public.base_action_rule_ir_act_server_rel (
    base_action_rule_id integer NOT NULL,
    ir_act_server_id integer NOT NULL
);

CREATE TABLE public.base_action_rule_lead_test (
    id integer NOT NULL,
    customer boolean,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    user_id integer,
    date_action_last timestamp without time zone,
    write_uid integer,
    priority boolean,
    state character varying,
    deadline boolean,
    is_assigned_to_admin boolean,
    write_date timestamp without time zone,
    active boolean,
    partner_id integer
);

CREATE TABLE public.base_action_rule_line_test (
    id integer NOT NULL,
    create_uid integer,
    user_id integer,
    lead_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    name character varying
);

CREATE TABLE public.base_action_rule_res_partner_rel (
    base_action_rule_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.base_config_settings (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    module_google_calendar boolean,
    module_auth_oauth boolean,
    company_share_partner boolean,
    create_uid integer,
    company_id integer NOT NULL,
    module_base_import boolean,
    module_portal boolean,
    group_multi_currency boolean,
    module_google_drive boolean,
    write_date timestamp without time zone,
    module_inter_company_rules boolean,
    group_multi_company boolean,
    module_share boolean,
    alias_domain character varying,
    fail_counter integer,
    auth_signup_uninvited boolean,
    auth_signup_template_user_id integer,
    auth_signup_reset_password boolean,
    fcm_project_id character varying,
    fcm_api_key character varying,
    company_share_product boolean,
    group_product_variant integer
);

CREATE TABLE public.base_import_import (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    file_type character varying,
    file_name character varying,
    write_uid integer,
    file bytea,
    res_model character varying,
    create_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char_noreadonly (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char_readonly (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char_required (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char_states (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_char_stillreadonly (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_m2o (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value integer,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_m2o_related (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value integer,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_m2o_required (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_m2o_required_related (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value integer,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_o2m (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_o2m_child (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    value integer,
    write_uid integer,
    parent_id integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_import_tests_models_preview (
    id integer NOT NULL,
    create_uid integer,
    othervalue integer,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    somevalue integer NOT NULL
);

CREATE TABLE public.base_language_export (
    id integer NOT NULL,
    lang character varying NOT NULL,
    create_uid integer,
    name character varying,
    format character varying NOT NULL,
    write_uid integer,
    state character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    data bytea
);

CREATE TABLE public.base_language_import (
    id integer NOT NULL,
    create_uid integer,
    code character varying(5) NOT NULL,
    name character varying NOT NULL,
    filename character varying NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    data bytea NOT NULL,
    overwrite boolean
);

CREATE TABLE public.base_language_install (
    id integer NOT NULL,
    lang character varying NOT NULL,
    create_uid integer,
    write_uid integer,
    state character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    overwrite boolean
);

CREATE TABLE public.base_language_install_website_rel (
    base_language_install_id integer NOT NULL,
    website_id integer NOT NULL
);

CREATE TABLE public.base_module_configuration (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_module_update (
    id integer NOT NULL,
    create_uid integer,
    updated integer,
    added integer,
    write_uid integer,
    state character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.base_module_upgrade (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    module_info text
);

CREATE TABLE public.base_partner_merge_automatic_wizard (
    id integer NOT NULL,
    exclude_journal_item boolean,
    create_uid integer,
    maximum_group integer,
    create_date timestamp without time zone,
    group_by_name boolean,
    group_by_vat boolean,
    dst_partner_id integer,
    exclude_contact boolean,
    group_by_is_company boolean,
    write_uid integer,
    current_line_id integer,
    state character varying NOT NULL,
    number_group integer,
    write_date timestamp without time zone,
    group_by_email boolean,
    group_by_parent_id boolean
);

CREATE TABLE public.base_partner_merge_automatic_wizard_res_partner_rel (
    base_partner_merge_automatic_wizard_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.base_partner_merge_line (
    id integer NOT NULL,
    create_uid integer,
    wizard_id integer,
    write_uid integer,
    min_id integer,
    write_date timestamp without time zone,
    aggr_ids character varying NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.base_update_translations (
    id integer NOT NULL,
    lang character varying NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.base_validator (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    help_message text,
    write_uid integer,
    validation_code text NOT NULL,
    write_date timestamp without time zone,
    input_test_string character varying,
    create_date timestamp without time zone
);

CREATE TABLE public.bus_bus (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    message character varying,
    channel character varying
);

CREATE TABLE public.bus_presence (
    id integer NOT NULL,
    status character varying,
    user_id integer NOT NULL,
    last_presence timestamp without time zone,
    last_poll timestamp without time zone
);

CREATE TABLE public.calendar_alarm (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    "interval" character varying NOT NULL,
    write_uid integer,
    duration_minutes integer,
    write_date timestamp without time zone,
    duration integer NOT NULL,
    create_date timestamp without time zone,
    type character varying NOT NULL
);

CREATE TABLE public.calendar_alarm_calendar_event_rel (
    calendar_event_id integer NOT NULL,
    calendar_alarm_id integer NOT NULL
);

CREATE TABLE public.calendar_attendee (
    id integer NOT NULL,
    create_uid integer,
    access_token character varying,
    availability character varying,
    event_id integer,
    state character varying,
    write_date timestamp without time zone,
    common_name character varying,
    create_date timestamp without time zone,
    write_uid integer,
    partner_id integer,
    email character varying
);

CREATE TABLE public.calendar_contacts (
    id integer NOT NULL,
    create_uid integer,
    user_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    partner_id integer NOT NULL
);

CREATE TABLE public.calendar_event (
    id integer NOT NULL,
    allday boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    fr boolean,
    write_uid integer,
    start_datetime timestamp without time zone,
    month_by character varying,
    stop_date date,
    rrule character varying,
    duration double precision,
    final_date date,
    create_uid integer,
    user_id integer,
    privacy character varying,
    tu boolean,
    message_last_post timestamp without time zone,
    state character varying,
    week_list character varying,
    show_as character varying,
    start_date date,
    location character varying,
    th boolean,
    su boolean,
    start timestamp without time zone NOT NULL,
    recurrent_id_date timestamp without time zone,
    description text,
    stop timestamp without time zone NOT NULL,
    end_type character varying,
    stop_datetime timestamp without time zone,
    display_start character varying,
    active boolean,
    day integer,
    count integer,
    byday character varying,
    rrule_type character varying,
    name character varying NOT NULL,
    we boolean,
    mo boolean,
    "interval" integer,
    recurrent_id integer,
    recurrency boolean,
    sa boolean,
    opportunity_id integer
);

CREATE TABLE public.calendar_event_res_partner_rel (
    calendar_event_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.calendar_event_type (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.cash_box_in (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    ref character varying
);

CREATE TABLE public.cash_box_out (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.catanese_report_route (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    hours boolean,
    freight integer NOT NULL,
    date date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.categ_wiz_rel (
    wiz integer NOT NULL,
    categ integer NOT NULL
);

CREATE TABLE public.change_password_user (
    id integer NOT NULL,
    create_uid integer,
    user_login character varying,
    new_passwd character varying,
    wizard_id integer NOT NULL,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    user_id integer NOT NULL
);

CREATE TABLE public.change_password_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.change_produced_qty (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    production_id integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    product_qty numeric NOT NULL
);

CREATE TABLE public.change_production_qty (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    mo_id integer NOT NULL,
    write_date timestamp without time zone,
    product_qty numeric NOT NULL
);

CREATE TABLE public.change_production_recipe_qty (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    recipe_qty double precision NOT NULL,
    write_date timestamp without time zone,
    product_qty numeric NOT NULL,
    create_date timestamp without time zone,
    mo_id integer NOT NULL
);

CREATE TABLE public.context_to_account (
    account_context_general_ledger_id integer NOT NULL,
    account_account_id integer NOT NULL
);

CREATE TABLE public.context_to_account_coa (
    account_context_coa_id integer NOT NULL,
    account_account_id integer NOT NULL
);

CREATE TABLE public.context_to_account_dgl (
    account_context_detail_general_ledger_id integer NOT NULL,
    account_account_id integer NOT NULL
);

CREATE TABLE public.context_to_line (
    account_financial_html_report_context_id integer NOT NULL,
    account_financial_html_report_line_id integer NOT NULL
);

CREATE TABLE public.crm_activity (
    id integer NOT NULL,
    create_uid integer,
    sequence integer,
    days integer,
    write_uid integer,
    team_id integer,
    subtype_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.crm_activity_log (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    lead_id integer NOT NULL,
    date_deadline date,
    recommended_activity_id integer,
    last_activity_id integer,
    title_action character varying,
    note text,
    team_id integer,
    write_date timestamp without time zone,
    next_activity_id integer,
    date_action date,
    write_uid integer,
    planned_revenue double precision
);

CREATE TABLE public.crm_activity_rel (
    recommended_id integer NOT NULL,
    activity_id integer NOT NULL
);

CREATE TABLE public.crm_lead (
    id integer NOT NULL,
    date_closed timestamp without time zone,
    create_date timestamp without time zone,
    probability double precision,
    message_last_post timestamp without time zone,
    color integer,
    date_last_stage_update timestamp without time zone,
    date_action_last timestamp without time zone,
    campaign_id integer,
    day_close double precision,
    write_uid integer,
    team_id integer,
    day_open double precision,
    contact_name character varying,
    partner_id integer,
    date_action_next timestamp without time zone,
    city character varying,
    date_conversion timestamp without time zone,
    opt_out boolean,
    date_open timestamp without time zone,
    title integer,
    partner_name character varying,
    planned_revenue double precision,
    country_id integer,
    company_id integer,
    priority character varying,
    next_activity_id integer,
    email_cc text,
    type character varying NOT NULL,
    function character varying,
    fax character varying,
    zip character varying,
    description text,
    create_uid integer,
    street2 character varying,
    title_action character varying,
    phone character varying,
    lost_reason integer,
    write_date timestamp without time zone,
    state_id integer,
    active boolean,
    user_id integer,
    date_action date,
    name character varying NOT NULL,
    stage_id integer,
    medium_id integer,
    date_deadline date,
    mobile character varying,
    street character varying,
    source_id integer,
    email_from character varying,
    message_bounce integer,
    referred character varying,
    CONSTRAINT crm_lead_check_probability CHECK (((probability >= (0)::double precision) AND (probability <= (100)::double precision)))
);

CREATE TABLE public.mail_message (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    mail_server_id integer,
    write_uid integer,
    subject character varying,
    create_uid integer,
    parent_id integer,
    subtype_id integer,
    res_id integer,
    message_id character varying,
    body text,
    record_name character varying,
    no_auto_thread boolean,
    date timestamp without time zone,
    author_id integer,
    reply_to character varying,
    model character varying,
    message_type character varying NOT NULL,
    email_from character varying,
    website_published boolean
);

CREATE TABLE public.crm_lead2opportunity_partner (
    id integer NOT NULL,
    create_uid integer,
    user_id integer,
    name character varying NOT NULL,
    team_id integer,
    write_date timestamp without time zone,
    action character varying NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    partner_id integer
);

CREATE TABLE public.crm_lead2opportunity_partner_mass (
    id integer NOT NULL,
    create_uid integer,
    deduplicate boolean,
    name character varying NOT NULL,
    user_id integer,
    force_assignation boolean,
    team_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    action character varying NOT NULL,
    create_date timestamp without time zone,
    partner_id integer
);

CREATE TABLE public.crm_lead2opportunity_partner_mass_res_users_rel (
    crm_lead2opportunity_partner_mass_id integer NOT NULL,
    res_users_id integer NOT NULL
);

CREATE TABLE public.crm_lead_crm_lead2opportunity_partner_mass_rel (
    crm_lead2opportunity_partner_mass_id integer NOT NULL,
    crm_lead_id integer NOT NULL
);

CREATE TABLE public.crm_lead_crm_lead2opportunity_partner_rel (
    crm_lead2opportunity_partner_id integer NOT NULL,
    crm_lead_id integer NOT NULL
);

CREATE TABLE public.crm_lead_lost (
    id integer NOT NULL,
    lost_reason_id integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    create_uid integer
);

CREATE TABLE public.crm_lead_tag (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    color integer,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.crm_lead_tag_rel (
    lead_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE public.crm_lost_reason (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean
);

CREATE TABLE public.crm_merge_opportunity (
    id integer NOT NULL,
    create_uid integer,
    team_id integer,
    write_date timestamp without time zone,
    user_id integer,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.crm_partner_binding (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    action character varying NOT NULL,
    create_date timestamp without time zone,
    partner_id integer
);

CREATE TABLE public.crm_stage (
    id integer NOT NULL,
    create_uid integer,
    requirements text,
    name character varying NOT NULL,
    probability double precision NOT NULL,
    on_change boolean,
    sequence integer,
    write_uid integer,
    fold boolean,
    team_id integer,
    legend_priority text,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.crm_team (
    id integer NOT NULL,
    create_date timestamp without time zone,
    color integer,
    write_uid integer,
    create_uid integer,
    user_id integer,
    message_last_post timestamp without time zone,
    company_id integer,
    write_date timestamp without time zone,
    active boolean,
    name character varying NOT NULL,
    reply_to character varying,
    alias_id integer NOT NULL,
    use_leads boolean,
    use_opportunities boolean,
    resource_calendar_id integer,
    use_quotations boolean,
    invoiced_target integer,
    use_invoices boolean
);

CREATE TABLE public.currencies_customer_context_to_payment (
    currencies_customer_ledger_context_report_id integer NOT NULL,
    account_payment_group_id integer NOT NULL
);

CREATE TABLE public.currencies_customer_ledger_context_report (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    wizard_id integer,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.currencies_vendor_context_to_payment (
    currencies_vendor_ledger_context_report_id integer NOT NULL,
    account_payment_group_id integer NOT NULL
);

CREATE TABLE public.currencies_vendor_ledger_context_report (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    wizard_id integer,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.customer_invoice_lines (
    id integer NOT NULL,
    create_uid integer,
    customer_wizard_id integer,
    total_amount double precision NOT NULL,
    invoice_id integer NOT NULL,
    payment_diff double precision,
    amount_to_pay double precision,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    partner_id integer,
    payment_method_id integer
);

CREATE TABLE public.customer_ledger_to_partners (
    currencies_customer_ledger_context_report_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.customer_multi_payments (
    id integer NOT NULL,
    create_date timestamp without time zone,
    communication character varying,
    write_uid integer,
    currency_id integer NOT NULL,
    partner_id integer,
    payment_method_id integer NOT NULL,
    create_uid integer,
    payment_date date NOT NULL,
    memo character varying,
    partner_type character varying,
    write_date timestamp without time zone,
    is_customer boolean,
    final_amount double precision,
    journal_id integer NOT NULL,
    amount numeric NOT NULL,
    payment_type character varying NOT NULL
);

CREATE TABLE public.customer_outstanding_statement_wizard (
    id integer NOT NULL,
    create_uid integer,
    number_partner_ids integer,
    date_end date NOT NULL,
    company_id integer,
    write_uid integer,
    show_aging_buckets boolean,
    filter_partners_non_due boolean,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.customer_outstanding_statement_wizard2 (
    id integer NOT NULL,
    create_uid integer,
    number_partner_ids integer,
    date_end date NOT NULL,
    company_id integer,
    write_uid integer,
    show_aging_buckets boolean,
    create_date timestamp without time zone,
    filter_partners_non_due boolean,
    write_date timestamp without time zone,
    type character varying,
    print_by character varying NOT NULL
);

CREATE TABLE public.customer_outstanding_statement_wizard2_res_partner_rel (
    customer_outstanding_statement_wizard2_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.decimal_precision (
    id integer NOT NULL,
    digits integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.decimal_precision_test (
    id integer NOT NULL,
    create_uid integer,
    float_2 numeric,
    "float" double precision,
    float_4 numeric,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.delivery_carrier (
    id integer NOT NULL,
    write_uid integer,
    prod_environment boolean,
    free_if_more_than boolean,
    create_date timestamp without time zone,
    zip_to character varying,
    sequence integer,
    fixed_price double precision,
    create_uid integer,
    integration_level character varying,
    delivery_type character varying NOT NULL,
    product_id integer NOT NULL,
    zip_from character varying,
    margin integer,
    amount double precision,
    write_date timestamp without time zone,
    woo_code character varying,
    CONSTRAINT delivery_carrier_margin_not_under_100_percent CHECK ((margin >= '-100'::integer))
);

CREATE TABLE public.delivery_carrier_country_rel (
    carrier_id integer NOT NULL,
    country_id integer NOT NULL
);

CREATE TABLE public.delivery_carrier_state_rel (
    carrier_id integer NOT NULL,
    state_id integer NOT NULL
);

CREATE TABLE public.delivery_price_rule (
    id integer NOT NULL,
    create_uid integer,
    list_price numeric NOT NULL,
    sequence integer NOT NULL,
    max_value double precision NOT NULL,
    standard_price numeric NOT NULL,
    carrier_id integer NOT NULL,
    write_uid integer,
    list_base_price numeric NOT NULL,
    variable character varying NOT NULL,
    variable_factor character varying NOT NULL,
    write_date timestamp without time zone,
    operator character varying NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.email_template_attachment_rel (
    email_template_id integer NOT NULL,
    attachment_id integer NOT NULL
);

CREATE TABLE public.email_template_preview (
    id integer NOT NULL,
    create_date timestamp without time zone,
    sub_object integer,
    auto_delete boolean,
    mail_server_id integer,
    write_uid integer,
    partner_to character varying,
    ref_ir_act_window integer,
    subject character varying,
    create_uid integer,
    report_template integer,
    ref_ir_value integer,
    user_signature boolean,
    null_value character varying,
    email_cc character varying,
    res_id character varying,
    model_id integer,
    sub_model_object_field integer,
    body_html text,
    email_to character varying,
    scheduled_date character varying,
    write_date timestamp without time zone,
    copyvalue character varying,
    lang character varying,
    name character varying,
    model_object_field integer,
    report_name character varying,
    use_default_to boolean,
    reply_to character varying,
    model character varying,
    email_from character varying,
    defflag boolean
);

CREATE TABLE public.email_template_preview_res_partner_rel (
    email_template_preview_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.employee_category_rel (
    category_id integer NOT NULL,
    emp_id integer NOT NULL
);

CREATE TABLE public.ept_app_key_data (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    app character varying NOT NULL,
    key character varying NOT NULL,
    flag_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    ept_flag boolean
);

CREATE TABLE public.excel_citi_extended (
    id integer NOT NULL,
    excel_file_p_imp bytea,
    create_uid integer,
    file_name_p_cbte character varying(64),
    create_date timestamp without time zone,
    file_name_v_alic character varying(64),
    excel_file_p_cbte bytea,
    write_uid integer,
    excel_file_p_alic bytea,
    file_name_p_imp character varying(64),
    write_date timestamp without time zone,
    file_name_p_alic character varying(64),
    file_name_v_cbte character varying(64),
    excel_file_v_alic bytea,
    excel_file_v_cbte bytea,
    errors bytea,
    file_errors character varying(64)
);

CREATE TABLE public.excel_digital_vat (
    id integer NOT NULL,
    file_name_tv_cbte character varying(64),
    create_date timestamp without time zone,
    file_p_imp bytea,
    file_name_v_alic character varying(64),
    file_v_alic bytea,
    write_uid integer,
    file_name_p_imp character varying(64),
    file_errors character varying(64),
    create_uid integer,
    file_name_p_cbte character varying(64),
    errors bytea,
    file_p_alic bytea,
    file_name_null_cbte character varying(64),
    file_name_v_cbte character varying(64),
    file_p_cbte bytea,
    file_tc_cbte bytea,
    file_null_cbte bytea,
    file_name_tc_cbte character varying(64),
    write_date timestamp without time zone,
    file_v_cbte bytea,
    file_s_imp bytea,
    file_name_s_imp character varying(64),
    file_tv_cbte bytea,
    file_name_p_alic character varying(64)
);

CREATE TABLE public.excel_extended (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    file_name character varying(64),
    excel_file bytea
);

CREATE TABLE public.expense_tax (
    expense_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.fetchmail_server (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    date timestamp without time zone,
    port integer,
    create_uid integer,
    configuration text,
    script character varying,
    object_id integer,
    priority integer,
    attach boolean,
    state character varying,
    type character varying NOT NULL,
    action_id integer,
    "user" character varying,
    write_date timestamp without time zone,
    active boolean,
    password character varying,
    name character varying NOT NULL,
    is_ssl boolean,
    server character varying,
    original boolean
);

CREATE TABLE public.freight_freight (
    id integer NOT NULL,
    create_uid integer,
    name character varying(255) NOT NULL,
    vehicle character varying(255),
    write_uid integer,
    write_date timestamp without time zone,
    weight_max numeric,
    active boolean,
    create_date timestamp without time zone,
    partner_id integer,
    volume_max numeric
);

CREATE TABLE public.hr_contract (
    id integer NOT NULL,
    working_hours integer,
    trial_date_end date,
    date_end date,
    write_uid integer,
    create_date timestamp without time zone,
    visa_expire date,
    create_uid integer,
    employee_id integer NOT NULL,
    job_id integer,
    date_start date NOT NULL,
    message_last_post timestamp without time zone,
    visa_no character varying,
    state character varying,
    department_id integer,
    wage numeric NOT NULL,
    advantages text,
    write_date timestamp without time zone,
    type_id integer NOT NULL,
    trial_date_start date,
    name character varying NOT NULL,
    notes text,
    permit_no character varying
);

CREATE TABLE public.hr_contract_type (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    sequence integer,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.hr_department (
    id integer NOT NULL,
    create_date timestamp without time zone,
    color integer,
    write_uid integer,
    create_uid integer,
    parent_id integer,
    message_last_post timestamp without time zone,
    company_id integer,
    note text,
    manager_id integer,
    write_date timestamp without time zone,
    active boolean,
    name character varying NOT NULL
);

CREATE TABLE public.hr_employee (
    id integer NOT NULL,
    address_id integer,
    create_date timestamp without time zone,
    ssnid character varying,
    coach_id integer,
    message_last_post timestamp without time zone,
    color integer,
    marital character varying,
    identification_id character varying,
    bank_account_id integer,
    job_id integer,
    parent_id integer,
    work_phone character varying,
    resource_id integer NOT NULL,
    country_id integer,
    department_id integer,
    mobile_phone character varying,
    create_uid integer,
    birthday date,
    write_date timestamp without time zone,
    sinid character varying,
    write_uid integer,
    work_email character varying,
    work_location character varying,
    gender character varying,
    notes text,
    address_home_id integer,
    passport_id character varying,
    name_related character varying,
    children integer,
    manager boolean,
    medic_exam date,
    vehicle character varying,
    place_of_birth character varying,
    vehicle_distance integer
);

CREATE TABLE public.hr_employee_category (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    color integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.hr_expense (
    id integer NOT NULL,
    create_date timestamp without time zone,
    reference character varying,
    write_uid integer,
    currency_id integer,
    date date,
    description text,
    analytic_account_id integer,
    create_uid integer,
    employee_id integer NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying,
    account_id integer,
    write_date timestamp without time zone,
    payment_mode character varying,
    total_amount numeric,
    sheet_id integer,
    name character varying NOT NULL,
    product_uom_id integer NOT NULL,
    untaxed_amount numeric,
    product_id integer NOT NULL,
    unit_amount numeric NOT NULL,
    quantity numeric NOT NULL
);

CREATE TABLE public.hr_expense_config_settings (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    alias_prefix character varying,
    write_date timestamp without time zone,
    alias_domain character varying
);

CREATE TABLE public.hr_expense_refuse_wizard (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    description character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.hr_expense_register_payment_wizard (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    payment_date date NOT NULL,
    communication character varying,
    journal_id integer NOT NULL,
    write_uid integer,
    currency_id integer NOT NULL,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    partner_id integer NOT NULL,
    payment_method_id integer NOT NULL
);

CREATE TABLE public.hr_expense_sheet (
    id integer NOT NULL,
    address_id integer,
    total_amount numeric,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    journal_id integer,
    currency_id integer,
    create_uid integer,
    employee_id integer NOT NULL,
    account_move_id integer,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying NOT NULL,
    accounting_date date,
    department_id integer,
    responsible_id integer,
    write_uid integer,
    name character varying NOT NULL,
    bank_journal_id integer
);

CREATE TABLE public.hr_job (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    create_uid integer,
    requirements text,
    message_last_post timestamp without time zone,
    company_id integer,
    state character varying NOT NULL,
    expected_employees integer,
    department_id integer,
    description text,
    write_date timestamp without time zone,
    name character varying NOT NULL,
    no_of_recruitment integer,
    no_of_hired_employee integer,
    no_of_employee integer
);

CREATE TABLE public.import_order_status (
    id integer NOT NULL,
    status character varying,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.ir_actions (
    id integer NOT NULL,
    create_uid integer,
    help text,
    write_uid integer,
    write_date timestamp without time zone,
    usage character varying,
    create_date timestamp without time zone,
    type character varying NOT NULL,
    name character varying NOT NULL
);

CREATE TABLE public.ir_act_client (
    res_model character varying,
    params_store bytea,
    tag character varying NOT NULL,
    context character varying NOT NULL,
    target character varying
)
INHERITS (public.ir_actions);

CREATE TABLE public.ir_act_report_xml (
    parser character varying,
    header boolean,
    report_type character varying NOT NULL,
    ir_values_id integer,
    attachment character varying,
    report_sxw_content_data bytea,
    report_xml character varying,
    report_rml_content_data bytea,
    auto boolean,
    report_file character varying,
    multi boolean,
    report_xsl character varying,
    report_rml character varying,
    report_name character varying NOT NULL,
    attachment_use boolean,
    model character varying NOT NULL,
    paperformat_id integer,
    print_report_name character varying
)
INHERITS (public.ir_actions);

CREATE TABLE public.ir_act_server (
    code text,
    sequence integer,
    crud_model_id integer,
    ref_object character varying,
    wkf_model_id integer,
    crud_model_name character varying,
    use_relational_model character varying NOT NULL,
    use_create character varying NOT NULL,
    wkf_field_id integer,
    id_object character varying,
    state character varying NOT NULL,
    id_value character varying,
    action_id integer,
    model_id integer NOT NULL,
    wkf_model_name character varying,
    sub_model_object_field integer,
    link_new_record boolean,
    wkf_transition_id integer,
    sub_object integer,
    use_write character varying NOT NULL,
    condition character varying,
    copyvalue character varying,
    write_expression character varying,
    menu_ir_values_id integer,
    model_object_field integer,
    link_field_id integer,
    template_id integer,
    website_published boolean,
    website_path character varying
)
INHERITS (public.ir_actions);

CREATE TABLE public.ir_act_url (
    target character varying NOT NULL,
    url text NOT NULL
)
INHERITS (public.ir_actions);

CREATE TABLE public.ir_act_window (
    domain character varying,
    res_model character varying NOT NULL,
    search_view_id integer,
    src_model character varying,
    view_type character varying NOT NULL,
    view_id integer,
    view_mode character varying NOT NULL,
    multi boolean,
    target character varying,
    auto_search boolean,
    res_id integer,
    filter boolean,
    "limit" integer,
    context character varying NOT NULL
)
INHERITS (public.ir_actions);

CREATE TABLE public.ir_act_window_group_rel (
    act_id integer NOT NULL,
    gid integer NOT NULL
);

CREATE TABLE public.ir_act_window_view (
    id integer NOT NULL,
    create_uid integer,
    multi boolean,
    sequence integer,
    view_id integer,
    write_uid integer,
    view_mode character varying NOT NULL,
    write_date timestamp without time zone,
    act_window_id integer,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_actions_todo (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    sequence integer,
    write_uid integer,
    note text,
    state character varying NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    type character varying NOT NULL,
    action_id integer NOT NULL
);

CREATE TABLE public.ir_attachment (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    res_model character varying,
    write_uid integer,
    res_name character varying,
    db_datas bytea,
    file_size integer,
    create_uid integer,
    company_id integer,
    res_id integer,
    index_content text,
    type character varying NOT NULL,
    public boolean,
    store_fname character varying,
    description text,
    res_field character varying,
    mimetype character varying,
    name character varying NOT NULL,
    url character varying(1024),
    checksum character varying(40),
    datas_fname character varying,
    priority character varying
);

CREATE TABLE public.ir_config_parameter (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    value text NOT NULL,
    write_uid integer,
    key character varying NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_config_parameter_groups_rel (
    icp_id integer NOT NULL,
    group_id integer NOT NULL
);

CREATE TABLE public.ir_cron (
    id integer NOT NULL,
    function character varying,
    create_uid integer,
    interval_type character varying,
    user_id integer NOT NULL,
    name character varying NOT NULL,
    args text,
    numbercall integer,
    nextcall timestamp without time zone NOT NULL,
    priority integer,
    create_date timestamp without time zone,
    doall boolean,
    write_date timestamp without time zone,
    active boolean,
    interval_number integer,
    write_uid integer,
    model character varying
);

CREATE TABLE public.ir_exports (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    resource character varying
);

CREATE TABLE public.ir_exports_line (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone,
    export_id integer
);

CREATE TABLE public.ir_filters (
    id integer NOT NULL,
    sort text NOT NULL,
    model_id character varying NOT NULL,
    domain text NOT NULL,
    user_id integer,
    name character varying NOT NULL,
    create_uid integer,
    write_uid integer,
    is_default boolean,
    create_date timestamp without time zone,
    context text NOT NULL,
    active boolean,
    write_date timestamp without time zone,
    action_id integer
);

CREATE TABLE public.ir_logging (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    level character varying,
    message text NOT NULL,
    func character varying NOT NULL,
    write_date timestamp without time zone,
    path character varying NOT NULL,
    line character varying NOT NULL,
    write_uid integer,
    type character varying NOT NULL,
    dbname character varying
);

CREATE TABLE public.ir_mail_server (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    write_uid integer,
    smtp_port integer NOT NULL,
    smtp_host character varying NOT NULL,
    smtp_user character varying(64),
    smtp_pass character varying(64),
    smtp_debug boolean,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    smtp_encryption character varying NOT NULL
);

CREATE TABLE public.ir_model (
    id integer NOT NULL,
    model character varying NOT NULL,
    name character varying NOT NULL,
    state character varying,
    info text,
    transient boolean,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_model_access (
    id integer NOT NULL,
    model_id integer NOT NULL,
    perm_read boolean,
    name character varying NOT NULL,
    create_uid integer,
    write_uid integer,
    perm_write boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    perm_unlink boolean,
    active boolean,
    perm_create boolean,
    group_id integer
);

CREATE TABLE public.ir_model_constraint (
    id integer NOT NULL,
    date_init timestamp without time zone,
    date_update timestamp without time zone,
    module integer NOT NULL,
    model integer NOT NULL,
    type character varying(1) NOT NULL,
    definition character varying,
    name character varying NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_model_data (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    noupdate boolean,
    name character varying NOT NULL,
    date_init timestamp without time zone,
    date_update timestamp without time zone,
    module character varying NOT NULL,
    model character varying NOT NULL,
    res_id integer
);

CREATE TABLE public.ir_model_fields (
    id integer NOT NULL,
    model character varying NOT NULL,
    model_id integer NOT NULL,
    name character varying NOT NULL,
    state character varying DEFAULT 'base'::character varying NOT NULL,
    field_description character varying NOT NULL,
    help text,
    ttype character varying NOT NULL,
    relation character varying,
    relation_field character varying,
    index boolean,
    copy boolean,
    related character varying,
    readonly boolean DEFAULT false,
    required boolean DEFAULT false,
    selectable boolean DEFAULT false,
    translate boolean DEFAULT false,
    serialization_field_id integer,
    relation_table character varying,
    column1 character varying,
    column2 character varying,
    store boolean,
    domain character varying,
    selection character varying,
    create_date timestamp without time zone,
    on_delete character varying,
    write_uid integer,
    depends character varying,
    size integer,
    complete_name character varying,
    create_uid integer,
    compute text,
    write_date timestamp without time zone,
    CONSTRAINT ir_model_fields_size_gt_zero CHECK ((size >= 0))
);

CREATE TABLE public.ir_model_fields_group_rel (
    field_id integer NOT NULL,
    group_id integer NOT NULL
);

CREATE TABLE public.ir_model_relation (
    id integer NOT NULL,
    date_init timestamp without time zone,
    date_update timestamp without time zone,
    module integer NOT NULL,
    model integer NOT NULL,
    name character varying NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_module_category (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    parent_id integer,
    name character varying NOT NULL,
    description text,
    sequence integer,
    visible boolean
);

CREATE TABLE public.ir_module_module (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    website character varying,
    summary character varying,
    name character varying NOT NULL,
    author character varying,
    icon character varying,
    state character varying(16),
    latest_version character varying,
    shortdesc character varying,
    category_id integer,
    description text,
    application boolean DEFAULT false,
    demo boolean DEFAULT false,
    web boolean DEFAULT false,
    license character varying(32),
    sequence integer DEFAULT 100,
    auto_install boolean DEFAULT false,
    maintainer character varying,
    contributors text,
    views_by_module text,
    published_version character varying,
    menus_by_module text,
    url character varying,
    reports_by_module text
);

CREATE TABLE public.ir_module_module_dependency (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    name character varying,
    module_id integer
);

CREATE TABLE public.ir_property (
    id integer NOT NULL,
    create_uid integer,
    value_integer integer,
    value_float double precision,
    name character varying,
    value_text text,
    res_id character varying,
    company_id integer,
    write_uid integer,
    fields_id integer NOT NULL,
    value_datetime timestamp without time zone,
    value_binary bytea,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    value_reference character varying,
    type character varying NOT NULL
);

CREATE TABLE public.ir_rule (
    id integer NOT NULL,
    model_id integer NOT NULL,
    domain_force text,
    name character varying,
    create_uid integer,
    global boolean,
    write_uid integer,
    perm_write boolean,
    create_date timestamp without time zone,
    perm_unlink boolean,
    active boolean,
    perm_read boolean,
    perm_create boolean,
    write_date timestamp without time zone,
    CONSTRAINT ir_rule_no_access_rights CHECK (((perm_read <> false) OR (perm_write <> false) OR (perm_create <> false) OR (perm_unlink <> false)))
);

CREATE TABLE public.ir_sequence (
    id integer NOT NULL,
    use_date_range boolean,
    code character varying,
    name character varying NOT NULL,
    number_next integer NOT NULL,
    create_uid integer,
    implementation character varying NOT NULL,
    company_id integer,
    write_uid integer,
    padding integer NOT NULL,
    number_increment integer NOT NULL,
    prefix character varying,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    suffix character varying
);

CREATE TABLE public.ir_sequence_date_range (
    id integer NOT NULL,
    create_uid integer,
    number_next integer NOT NULL,
    date_from date NOT NULL,
    write_uid integer,
    sequence_id integer NOT NULL,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.ir_server_object_lines (
    id integer NOT NULL,
    create_uid integer,
    server_id integer,
    value text NOT NULL,
    col1 integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    type character varying NOT NULL
);

CREATE TABLE public.ir_translation (
    id integer NOT NULL,
    lang character varying,
    src text,
    name character varying NOT NULL,
    type character varying,
    module character varying,
    state character varying,
    comments text,
    value text,
    res_id integer
);

CREATE TABLE public.ir_ui_menu (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    name character varying NOT NULL,
    web_icon character varying,
    parent_id integer,
    sequence integer,
    write_uid integer,
    active boolean,
    write_date timestamp without time zone,
    create_uid integer,
    action character varying,
    create_date timestamp without time zone,
    load_xmlid boolean
);

CREATE TABLE public.ir_ui_menu_group_rel (
    menu_id integer NOT NULL,
    gid integer NOT NULL
);

CREATE TABLE public.ir_ui_view (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    field_parent character varying,
    inherit_id integer,
    model_data_id integer,
    priority integer NOT NULL,
    type character varying,
    arch_db text,
    create_uid integer,
    key character varying,
    active boolean,
    arch_fs character varying,
    name character varying NOT NULL,
    mode character varying NOT NULL,
    model character varying,
    website_id integer,
    customize_show boolean,
    website_meta_title character varying,
    website_meta_description text,
    website_meta_keywords character varying,
    page boolean,
    CONSTRAINT ir_ui_view_inheritance_mode CHECK ((((mode)::text <> 'extension'::text) OR (inherit_id IS NOT NULL)))
);

CREATE TABLE public.ir_ui_view_custom (
    id integer NOT NULL,
    create_uid integer,
    user_id integer NOT NULL,
    ref_id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    arch text NOT NULL
);

CREATE TABLE public.ir_ui_view_group_rel (
    view_id integer NOT NULL,
    group_id integer NOT NULL
);

CREATE TABLE public.ir_values (
    id integer NOT NULL,
    model_id integer,
    user_id integer,
    name character varying NOT NULL,
    create_uid integer,
    key2 character varying,
    company_id integer,
    value text,
    write_uid integer,
    create_date timestamp without time zone,
    key character varying NOT NULL,
    write_date timestamp without time zone,
    model character varying NOT NULL,
    res_id integer,
    action_id integer
);

CREATE TABLE public.issue_checks_states (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    states character varying,
    write_date timestamp without time zone
);

CREATE TABLE public.jurisdiction_codes (
    id integer NOT NULL,
    create_uid integer,
    name character varying(3),
    region integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    "desc" character varying(30)
);

CREATE TABLE public.l1 (
    l2 integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.l3 (
    l4 integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.log_account_account (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    acc_name character varying(130),
    write_uid integer,
    "user" character varying(30),
    wh_codes character varying,
    create_date timestamp without time zone
);

CREATE TABLE public.mail_alias (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    alias_defaults text NOT NULL,
    alias_contact character varying NOT NULL,
    alias_parent_model_id integer,
    write_uid integer,
    alias_force_thread_id integer,
    alias_model_id integer NOT NULL,
    write_date timestamp without time zone,
    alias_parent_thread_id integer,
    alias_user_id integer,
    alias_name character varying
);

CREATE TABLE public.mail_channel (
    id integer NOT NULL,
    create_date timestamp without time zone,
    alias_id integer NOT NULL,
    write_uid integer,
    uuid character varying(50),
    message_last_post timestamp without time zone,
    description text,
    create_uid integer,
    group_public_id integer,
    write_date timestamp without time zone,
    name character varying NOT NULL,
    public character varying NOT NULL,
    channel_type character varying,
    email_send boolean
);

CREATE TABLE public.mail_channel_mail_wizard_invite_rel (
    mail_wizard_invite_id integer NOT NULL,
    mail_channel_id integer NOT NULL
);

CREATE TABLE public.mail_channel_partner (
    id integer NOT NULL,
    seen_message_id integer,
    create_uid integer,
    is_minimized boolean,
    is_pinned boolean,
    write_uid integer,
    channel_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    partner_id integer,
    fold_state character varying
);

CREATE TABLE public.mail_channel_res_groups_rel (
    mail_channel_id integer NOT NULL,
    res_groups_id integer NOT NULL
);

CREATE TABLE public.mail_compose_message (
    id integer NOT NULL,
    auto_delete_message boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    auto_delete boolean,
    mail_server_id integer,
    write_uid integer,
    notify boolean,
    active_domain text,
    subject character varying,
    composition_mode character varying,
    create_uid integer,
    is_log boolean,
    parent_id integer,
    subtype_id integer,
    res_id integer,
    message_id character varying,
    body text,
    record_name character varying,
    no_auto_thread boolean,
    date timestamp without time zone,
    author_id integer,
    use_active_domain boolean,
    template_id integer,
    reply_to character varying,
    model character varying,
    message_type character varying NOT NULL,
    email_from character varying,
    website_published boolean
);

CREATE TABLE public.mail_compose_message_ir_attachments_rel (
    wizard_id integer NOT NULL,
    attachment_id integer NOT NULL
);

CREATE TABLE public.mail_compose_message_res_partner_rel (
    wizard_id integer NOT NULL,
    partner_id integer NOT NULL
);

CREATE TABLE public.mail_followers (
    id integer NOT NULL,
    res_model character varying NOT NULL,
    partner_id integer,
    channel_id integer,
    res_id integer,
    CONSTRAINT mail_followers_partner_xor_channel CHECK (((partner_id IS NULL) <> (channel_id IS NULL)))
);

CREATE TABLE public.mail_followers_mail_message_subtype_rel (
    mail_followers_id integer NOT NULL,
    mail_message_subtype_id integer NOT NULL
);

CREATE TABLE public.mail_mail (
    id integer NOT NULL,
    create_date timestamp without time zone,
    auto_delete boolean,
    write_uid integer,
    "references" text,
    create_uid integer,
    notification boolean,
    state character varying,
    email_cc character varying,
    body_html text,
    email_to text,
    scheduled_date character varying,
    mail_message_id integer NOT NULL,
    failure_reason text,
    headers text,
    write_date timestamp without time zone,
    fetchmail_server_id integer
);

CREATE TABLE public.mail_mail_res_partner_rel (
    mail_mail_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.mail_message_mail_channel_rel (
    mail_message_id integer NOT NULL,
    mail_channel_id integer NOT NULL
);

CREATE TABLE public.mail_message_res_partner_needaction_rel (
    id integer NOT NULL,
    mail_message_id integer NOT NULL,
    is_email boolean,
    is_read boolean,
    res_partner_id integer NOT NULL,
    email_status character varying
);

CREATE TABLE public.mail_message_res_partner_rel (
    mail_message_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.mail_message_res_partner_starred_rel (
    mail_message_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.mail_message_subtype (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    description text,
    sequence integer,
    "default" boolean,
    res_model character varying,
    write_uid integer,
    parent_id integer,
    internal boolean,
    write_date timestamp without time zone,
    relation_field character varying,
    hidden boolean,
    name character varying NOT NULL
);

CREATE TABLE public.mail_push_device (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone,
    service_type character varying,
    create_date timestamp without time zone,
    subscription_id character varying,
    partner_id integer
);

CREATE TABLE public.mail_shortcode (
    id integer NOT NULL,
    create_uid integer,
    description character varying,
    write_uid integer,
    source character varying NOT NULL,
    shortcode_type character varying NOT NULL,
    substitution text NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.mail_template (
    id integer NOT NULL,
    create_date timestamp without time zone,
    sub_object integer,
    auto_delete boolean,
    mail_server_id integer,
    write_uid integer,
    partner_to character varying,
    ref_ir_act_window integer,
    subject character varying,
    create_uid integer,
    report_template integer,
    ref_ir_value integer,
    user_signature boolean,
    null_value character varying,
    email_cc character varying,
    model_id integer,
    sub_model_object_field integer,
    body_html text,
    email_to character varying,
    scheduled_date character varying,
    write_date timestamp without time zone,
    copyvalue character varying,
    lang character varying,
    name character varying,
    model_object_field integer,
    report_name character varying,
    use_default_to boolean,
    reply_to character varying,
    model character varying,
    email_from character varying,
    defflag boolean
);

CREATE TABLE public.mail_test (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    create_uid integer,
    alias_id integer,
    message_last_post timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.mail_tracking_value (
    id integer NOT NULL,
    create_date timestamp without time zone,
    field_desc character varying NOT NULL,
    old_value_monetary double precision,
    new_value_text text,
    write_uid integer,
    field_type character varying,
    old_value_datetime timestamp without time zone,
    field character varying NOT NULL,
    new_value_datetime timestamp without time zone,
    new_value_integer integer,
    create_uid integer,
    new_value_monetary double precision,
    old_value_text text,
    write_date timestamp without time zone,
    mail_message_id integer NOT NULL,
    new_value_char character varying,
    old_value_char character varying,
    new_value_float double precision,
    old_value_float double precision,
    old_value_integer integer
);

CREATE TABLE public.mail_wizard_invite (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    res_model character varying NOT NULL,
    create_date timestamp without time zone,
    message text,
    res_id integer,
    send_mail boolean
);

CREATE TABLE public.mail_wizard_invite_res_partner_rel (
    mail_wizard_invite_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.make_procurement (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    product_id integer NOT NULL,
    res_model character varying,
    warehouse_id integer NOT NULL,
    date_planned date NOT NULL,
    write_uid integer,
    product_tmpl_id integer NOT NULL,
    uom_id integer NOT NULL,
    write_date timestamp without time zone,
    qty numeric NOT NULL
);

CREATE TABLE public.make_procurement_stock_location_route_rel (
    make_procurement_id integer NOT NULL,
    stock_location_route_id integer NOT NULL
);

CREATE TABLE public.meeting_category_rel (
    event_id integer NOT NULL,
    type_id integer NOT NULL
);

CREATE TABLE public.merge_opportunity_rel (
    merge_id integer NOT NULL,
    opportunity_id integer NOT NULL
);

CREATE TABLE public.message_attachment_rel (
    message_id integer NOT NULL,
    attachment_id integer NOT NULL
);

CREATE TABLE public.mrp_bom (
    id integer NOT NULL,
    code character varying,
    create_date timestamp without time zone,
    sequence integer,
    write_uid integer,
    product_qty numeric NOT NULL,
    create_uid integer,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    product_tmpl_id integer NOT NULL,
    routing_id integer,
    type character varying NOT NULL,
    ready_to_produce character varying NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    product_id integer,
    product_uom_id integer NOT NULL,
    picking_type_id integer
);

CREATE TABLE public.mrp_bom_line (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    product_id integer NOT NULL,
    sequence integer,
    product_uom_id integer NOT NULL,
    write_uid integer,
    routing_id integer,
    operation_id integer,
    write_date timestamp without time zone,
    product_qty numeric NOT NULL,
    bom_id integer NOT NULL,
    CONSTRAINT mrp_bom_line_bom_qty_zero CHECK ((product_qty > (0)::numeric))
);

CREATE TABLE public.mrp_bom_line_product_attribute_value_rel (
    mrp_bom_line_id integer NOT NULL,
    product_attribute_value_id integer NOT NULL
);

CREATE TABLE public.mrp_config_settings (
    id integer NOT NULL,
    module_quality_mrp integer,
    create_uid integer,
    module_mrp_maintenance integer,
    company_id integer NOT NULL,
    write_uid integer,
    module_mrp_plm integer,
    group_mrp_routings integer,
    module_mrp_byproduct integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    group_product_variant integer,
    module_mrp_mps integer
);

CREATE TABLE public.mrp_message (
    id integer NOT NULL,
    valid_until date NOT NULL,
    create_uid integer,
    name text,
    write_uid integer,
    product_tmpl_id integer,
    routing_id integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    bom_id integer,
    workcenter_id integer,
    message text NOT NULL,
    product_id integer
);

CREATE TABLE public.mrp_produce_stock_move_lots (
    mrp_product_produce_id integer NOT NULL,
    stock_move_lots_id integer NOT NULL
);

CREATE TABLE public.mrp_product_produce (
    id integer NOT NULL,
    create_uid integer,
    product_id integer,
    product_uom_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    production_id integer,
    product_qty numeric NOT NULL,
    write_date timestamp without time zone,
    lot_id integer,
    serial boolean
);

CREATE TABLE public.mrp_production (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    write_uid integer,
    product_qty numeric NOT NULL,
    procurement_group_id integer,
    user_id integer,
    location_src_id integer NOT NULL,
    picking_type_id integer NOT NULL,
    date_start timestamp without time zone,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    availability character varying,
    priority character varying,
    state character varying,
    bom_id integer,
    create_uid integer,
    date_finished timestamp without time zone,
    routing_id integer,
    propagate boolean,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    date_planned_start timestamp without time zone NOT NULL,
    name character varying,
    product_uom_id integer NOT NULL,
    date_planned_finished timestamp without time zone,
    location_dest_id integer NOT NULL,
    date_planned_finished_wo timestamp without time zone,
    date_planned_start_wo timestamp without time zone,
    recipe_qty double precision,
    CONSTRAINT mrp_production_qty_positive CHECK ((product_qty > (0)::numeric)),
    CONSTRAINT mrp_production_recipe_qty_positive CHECK ((recipe_qty > (0)::double precision))
);

CREATE TABLE public.mrp_routing (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    company_id integer,
    write_uid integer,
    note text,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    location_id integer,
    create_uid integer
);

CREATE TABLE public.mrp_routing_workcenter (
    id integer NOT NULL,
    create_date timestamp without time zone,
    time_mode_batch integer,
    sequence integer,
    write_uid integer,
    time_mode character varying,
    time_cycle_manual double precision,
    create_uid integer,
    company_id integer,
    note text,
    routing_id integer NOT NULL,
    workcenter_id integer NOT NULL,
    batch_size double precision,
    write_date timestamp without time zone,
    name character varying NOT NULL,
    worksheet bytea,
    batch character varying NOT NULL
);

CREATE TABLE public.mrp_subproduct (
    id integer NOT NULL,
    create_uid integer,
    product_id integer NOT NULL,
    product_uom_id integer NOT NULL,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    product_qty numeric NOT NULL,
    bom_id integer,
    operation_id integer
);

CREATE TABLE public.mrp_unbuild (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    product_qty double precision NOT NULL,
    lot_id integer,
    location_id integer NOT NULL,
    create_uid integer,
    message_last_post timestamp without time zone,
    state character varying,
    mo_id integer,
    bom_id integer NOT NULL,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    name character varying,
    product_uom_id integer NOT NULL,
    location_dest_id integer NOT NULL
);

CREATE TABLE public.mrp_workcenter (
    id integer NOT NULL,
    write_date timestamp without time zone,
    time_stop double precision,
    color integer,
    write_uid integer,
    create_date timestamp without time zone,
    create_uid integer,
    capacity double precision,
    resource_id integer NOT NULL,
    note text,
    sequence integer NOT NULL,
    time_start double precision,
    oee_target double precision,
    working_state character varying,
    costs_hour_account_id integer,
    costs_hour double precision
);

CREATE TABLE public.mrp_workcenter_productivity (
    id integer NOT NULL,
    loss_type character varying,
    user_id integer,
    description text,
    create_uid integer,
    loss_id integer NOT NULL,
    date_end timestamp without time zone,
    date_start timestamp without time zone NOT NULL,
    write_uid integer,
    create_date timestamp without time zone,
    workorder_id integer,
    write_date timestamp without time zone,
    duration double precision,
    workcenter_id integer NOT NULL,
    cost_already_recorded boolean
);

CREATE TABLE public.mrp_workcenter_productivity_loss (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    loss_type character varying NOT NULL,
    sequence integer,
    manual boolean,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.mrp_workorder (
    id integer NOT NULL,
    write_uid integer,
    next_work_order_id integer,
    duration double precision,
    create_date timestamp without time zone,
    duration_expected numeric,
    date_finished timestamp without time zone,
    create_uid integer,
    capacity double precision,
    production_date timestamp without time zone,
    date_start timestamp without time zone,
    message_last_post timestamp without time zone,
    state character varying,
    workcenter_id integer NOT NULL,
    duration_unit double precision,
    qty_produced numeric,
    qty_producing numeric,
    write_date timestamp without time zone,
    date_planned_start timestamp without time zone,
    name character varying NOT NULL,
    duration_percent integer,
    production_availability character varying,
    date_planned_finished timestamp without time zone,
    production_id integer NOT NULL,
    operation_id integer,
    final_lot_id integer
);

CREATE TABLE public.nl_inv_wizard (
    id integer NOT NULL,
    create_uid integer,
    open_only boolean,
    write_uid integer,
    date_from date NOT NULL,
    overviewf boolean,
    create_date timestamp without time zone,
    hide_internals boolean,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    slflag boolean,
    between_datesf boolean,
    print_by character varying
);

CREATE TABLE public.nl_inv_wizard_res_partner_rel (
    nl_inv_wizard_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.nl_setting_block (
    id integer NOT NULL,
    create_uid integer,
    module_account_asset boolean,
    group_choose_payment_type boolean,
    module_account_accountant boolean,
    create_date timestamp without time zone,
    has_chart_of_accounts boolean,
    complete_tax_set boolean,
    template_transfer_account_id integer,
    module_account_sepa boolean,
    module_account_bank_statement_import_csv boolean,
    module_account_budget boolean,
    company_id integer NOT NULL,
    point_of_sale_type character varying,
    group_analytic_account_for_sales boolean,
    group_warning_account integer,
    group_multi_currency boolean,
    group_proforma_invoices boolean,
    module_account_deferred_revenue boolean,
    module_account_reports boolean,
    module_account_plaid boolean,
    afip_ws character varying,
    purchase_tax_rate double precision,
    point_of_sale_number integer,
    module_account_bank_statement_import_ofx boolean,
    module_l10n_us_check_printing boolean,
    default_purchase_tax_id integer,
    write_date timestamp without time zone,
    write_uid integer,
    sale_tax_rate double precision,
    module_account_batch_deposit boolean,
    sale_use_documents boolean,
    module_account_yodlee boolean,
    module_account_tax_cash_basis boolean,
    module_account_reports_followup boolean,
    chart_template_id integer,
    default_sale_tax_id integer,
    sale_tax_id integer,
    has_default_company boolean,
    module_account_bank_statement_import_qif boolean,
    group_analytic_accounting boolean,
    group_analytic_account_for_purchases boolean,
    purchase_use_documents boolean,
    default_acquirer integer,
    purchase_tax_id integer,
    citi_sl_box boolean,
    nc_acc_control boolean,
    no_nc_partial boolean,
    nc_paym boolean,
    citi_pl_box boolean
);

CREATE TABLE public.partner_ledger_to_partners (
    account_partner_ledger_context_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.partner_market_category (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.partner_transaction_report_wizard (
    id integer NOT NULL,
    create_uid integer,
    initial_date date NOT NULL,
    end_date date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    type character varying
);

CREATE TABLE public.partner_transaction_report_wizard_res_partner_rel (
    partner_transaction_report_wizard_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.partner_transection_context_report (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    partner_id integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.partner_transection_context_to_payment (
    partner_transection_context_report_id integer NOT NULL,
    account_payment_group_id integer NOT NULL
);

CREATE TABLE public.partner_update_from_padron_rel (
    update_id integer NOT NULL,
    partner_id integer NOT NULL
);

CREATE TABLE public.payment_acquirer (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    fees_active boolean,
    journal_id integer,
    cancel_msg text,
    registration_view_template_id integer,
    module_id integer,
    fees_dom_fixed double precision,
    fees_int_fixed double precision,
    create_uid integer,
    save_token character varying,
    company_id integer NOT NULL,
    environment character varying NOT NULL,
    provider character varying NOT NULL,
    website_published boolean,
    auto_confirm character varying NOT NULL,
    description text,
    pending_msg text,
    post_msg text,
    fees_int_var double precision,
    done_msg text,
    pre_msg text,
    write_uid integer,
    error_msg text,
    fees_dom_var double precision,
    name character varying NOT NULL,
    view_template_id integer NOT NULL,
    sequence integer
);

CREATE TABLE public.payment_token (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    write_uid integer,
    create_date timestamp without time zone,
    acquirer_id integer NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    acquirer_ref character varying NOT NULL,
    partner_id integer NOT NULL
);

CREATE TABLE public.payment_transaction (
    id integer NOT NULL,
    state_message text,
    callback_eval character varying,
    create_date timestamp without time zone,
    reference character varying NOT NULL,
    write_uid integer,
    currency_id integer NOT NULL,
    acquirer_id integer NOT NULL,
    fees numeric,
    partner_id integer,
    create_uid integer,
    partner_name character varying,
    amount numeric NOT NULL,
    state character varying NOT NULL,
    type character varying NOT NULL,
    partner_country_id integer NOT NULL,
    acquirer_reference character varying,
    partner_address character varying,
    partner_email character varying,
    partner_lang character varying,
    write_date timestamp without time zone,
    payment_token_id integer,
    partner_zip character varying,
    html_3ds character varying,
    date_validate timestamp without time zone,
    partner_city character varying,
    partner_phone character varying,
    sale_order_id integer
);

CREATE TABLE public.permanent_lock_date_wizard (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    company_id integer,
    lock_date date,
    write_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.portal_wizard (
    id integer NOT NULL,
    create_uid integer,
    welcome_message text,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    portal_id integer NOT NULL
);

CREATE TABLE public.portal_wizard_user (
    id integer NOT NULL,
    create_uid integer,
    user_id integer,
    write_uid integer,
    wizard_id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    in_portal boolean,
    partner_id integer NOT NULL,
    email character varying
);

CREATE TABLE public.pre_prop_rel (
    sicore_tax_code_id integer NOT NULL,
    wh_code_id integer NOT NULL
);

CREATE TABLE public.procurement_group (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    move_type character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    partner_id integer
);

CREATE TABLE public.procurement_order (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    product_uom integer NOT NULL,
    write_uid integer,
    product_qty numeric NOT NULL,
    create_uid integer,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    priority character varying NOT NULL,
    state character varying NOT NULL,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    group_id integer,
    name text NOT NULL,
    date_planned timestamp without time zone NOT NULL,
    rule_id integer,
    sale_line_id integer,
    location_id integer,
    partner_dest_id integer,
    orderpoint_id integer,
    warehouse_id integer,
    move_dest_id integer,
    purchase_line_id integer,
    bom_id integer,
    production_id integer
);

CREATE TABLE public.procurement_order_compute_all (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.procurement_orderpoint_compute (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.procurement_rule (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    company_id integer,
    write_uid integer,
    active boolean,
    write_date timestamp without time zone,
    action character varying NOT NULL,
    create_date timestamp without time zone,
    group_id integer,
    group_propagation_option character varying,
    partner_address_id integer,
    location_id integer,
    location_src_id integer,
    picking_type_id integer NOT NULL,
    delay integer,
    warehouse_id integer,
    propagate boolean,
    procure_method character varying NOT NULL,
    route_sequence integer,
    route_id integer,
    propagate_warehouse_id integer
);

CREATE TABLE public.product_attribute (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_variant boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.product_attribute_line (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    product_tmpl_id integer NOT NULL,
    attribute_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.product_attribute_line_product_attribute_value_rel (
    product_attribute_line_id integer NOT NULL,
    product_attribute_value_id integer NOT NULL
);

CREATE TABLE public.product_attribute_price (
    id integer NOT NULL,
    create_uid integer,
    price_extra numeric,
    product_tmpl_id integer NOT NULL,
    value_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.product_attribute_value (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    attribute_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.product_attribute_value_product_product_rel (
    product_product_id integer NOT NULL,
    product_attribute_value_id integer NOT NULL
);

CREATE TABLE public.product_brand (
    id integer ,
    create_uid integer,
    description text,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    logo bytea,
    partner_id integer,
    name character varying
);

CREATE TABLE public.product_category (
    id integer,
    parent_left integer,
    parent_right integer,
    create_uid integer,
    name character varying,
    write_uid integer,
    parent_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    type character varying ,
    removal_strategy_id integer
);

CREATE TABLE public.product_flavor (
    id integer,
    create_uid integer,
    code integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.product_pack_cat (
    id integer,
    create_uid integer,
    cat_qty integer,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.product_packaging (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    qty double precision,
    product_tmpl_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    package_carrier_type character varying,
    shipper_package_code character varying,
    height integer,
    width integer,
    length integer,
    max_weight double precision,
    CONSTRAINT product_packaging_positive_height CHECK ((height >= 0)),
    CONSTRAINT product_packaging_positive_length CHECK ((length >= 0)),
    CONSTRAINT product_packaging_positive_max_weight CHECK ((max_weight >= (0.0)::double precision)),
    CONSTRAINT product_packaging_positive_width CHECK ((width >= 0))
);

CREATE TABLE public.product_price_history (
    id integer NOT NULL,
    create_uid integer,
    product_id integer NOT NULL,
    company_id integer NOT NULL,
    datetime timestamp without time zone,
    cost numeric,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer
);

CREATE TABLE public.product_price_list (
    id integer NOT NULL,
    create_uid integer,
    price_list integer NOT NULL,
    write_uid integer,
    qty1 integer,
    qty2 integer,
    qty3 integer,
    qty4 integer,
    qty5 integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.product_pricelist (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    company_id integer,
    write_uid integer,
    currency_id integer NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    discount_policy character varying
);

CREATE TABLE public.product_pricelist_item (
    id integer NOT NULL,
    fixed_price numeric,
    create_date timestamp without time zone,
    price_discount numeric,
    sequence integer NOT NULL,
    price_max_margin numeric,
    date_end date,
    write_uid integer,
    currency_id integer,
    applied_on character varying NOT NULL,
    min_quantity integer,
    create_uid integer,
    percent_price double precision,
    date_start date,
    company_id integer,
    product_tmpl_id integer,
    pricelist_id integer,
    price_min_margin numeric,
    compute_price character varying,
    base character varying NOT NULL,
    write_date timestamp without time zone,
    categ_id integer,
    price_surcharge numeric,
    price_round numeric,
    product_id integer,
    base_pricelist_id integer
);

CREATE TABLE public.product_putaway (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    method character varying NOT NULL
);

CREATE TABLE public.product_removal (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    method character varying NOT NULL,
    write_date timestamp without time zone
);

CREATE TABLE public.product_supplier_taxes_rel (
    prod_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.product_supplierinfo (
    id integer NOT NULL,
    create_uid integer,
    date_start date,
    create_date timestamp without time zone,
    product_id integer,
    sequence integer,
    product_name character varying,
    date_end date,
    company_id integer,
    write_uid integer,
    currency_id integer NOT NULL,
    delay integer NOT NULL,
    write_date timestamp without time zone,
    price numeric NOT NULL,
    min_qty double precision NOT NULL,
    product_code character varying,
    product_tmpl_id integer,
    name integer NOT NULL
);

CREATE TABLE public.product_taxes_rel (
    prod_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.product_uom_categ (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.purchase_config_settings (
    id integer NOT NULL,
    group_uom integer,
    create_date timestamp without time zone,
    module_stock_dropshipping integer,
    group_costing_method integer,
    group_manage_vendor_price integer,
    company_id integer NOT NULL,
    write_uid integer,
    group_warning_purchase integer,
    write_date timestamp without time zone,
    create_uid integer,
    group_product_variant integer,
    module_purchase_requisition integer,
    keep_exchange_rate boolean,
    group_use_manual_exchange_rate boolean
);

CREATE TABLE public.purchase_order (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    write_uid integer,
    currency_id integer NOT NULL,
    date_order timestamp without time zone NOT NULL,
    partner_id integer NOT NULL,
    dest_address_id integer,
    create_uid integer,
    amount_untaxed numeric,
    picking_type_id integer NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    name character varying NOT NULL,
    amount_tax numeric,
    state character varying,
    date_approve date,
    incoterm_id integer,
    payment_term_id integer,
    write_date timestamp without time zone,
    partner_ref character varying,
    fiscal_position_id integer,
    amount_total numeric,
    invoice_status character varying,
    date_planned timestamp without time zone,
    notes text,
    group_id integer,
    state_id integer,
    manual_currency_rate_active boolean,
    manual_currency_rate numeric
);

CREATE TABLE public.purchase_order_line (
    id integer NOT NULL,
    create_date timestamp without time zone,
    product_uom integer NOT NULL,
    price_unit numeric NOT NULL,
    qty_invoiced numeric,
    write_uid integer,
    currency_id integer,
    product_qty numeric NOT NULL,
    partner_id integer,
    qty_received numeric,
    create_uid integer,
    price_tax numeric,
    sequence integer,
    company_id integer,
    state character varying,
    account_analytic_id integer,
    order_id integer NOT NULL,
    price_subtotal numeric,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    price_total numeric,
    name text NOT NULL,
    date_planned timestamp without time zone NOT NULL
);

CREATE TABLE public.stock_picking_type (
    id integer NOT NULL,
    code character varying NOT NULL,
    create_date timestamp without time zone,
    sequence integer,
    color integer,
    write_uid integer,
    use_create_lots boolean,
    create_uid integer,
    default_location_dest_id integer,
    show_entire_packs boolean,
    barcode_nomenclature_id integer,
    use_existing_lots boolean,
    warehouse_id integer,
    sequence_id integer NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    name character varying NOT NULL,
    return_picking_type_id integer,
    default_location_src_id integer,
    avoid_internal_assignment boolean
);

CREATE TABLE public.rel_modules_langexport (
    wiz_id integer NOT NULL,
    module_id integer NOT NULL
);

CREATE TABLE public.rel_server_actions (
    server_id integer NOT NULL,
    action_id integer NOT NULL
);

CREATE TABLE public.report (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.report_account_payment_group_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.report_paperformat (
    id integer NOT NULL,
    create_uid integer,
    page_width integer,
    create_date timestamp without time zone,
    orientation character varying,
    name character varying NOT NULL,
    format character varying,
    "default" boolean,
    header_line boolean,
    dpi integer NOT NULL,
    write_uid integer,
    margin_right double precision,
    margin_top double precision,
    margin_left double precision,
    write_date timestamp without time zone,
    margin_bottom double precision,
    page_height integer,
    header_spacing integer
);

CREATE TABLE public.stock_location (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    comment text,
    putaway_strategy_id integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    partner_id integer,
    removal_strategy_id integer,
    scrap_location boolean,
    location_id integer,
    company_id integer,
    complete_name character varying,
    usage character varying NOT NULL,
    create_uid integer,
    barcode character varying,
    posz integer,
    posx integer,
    posy integer,
    active boolean,
    name character varying NOT NULL,
    return_location boolean,
    valuation_in_account_id integer,
    valuation_out_account_id integer
);

CREATE TABLE public.stock_move (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    restrict_partner_id integer,
    product_uom integer NOT NULL,
    price_unit double precision,
    product_uom_qty numeric NOT NULL,
    procure_method character varying NOT NULL,
    product_qty numeric,
    partner_id integer,
    priority character varying,
    picking_type_id integer,
    location_id integer NOT NULL,
    sequence integer,
    company_id integer NOT NULL,
    note text,
    state character varying,
    ordered_qty numeric,
    origin_returned_move_id integer,
    product_packaging integer,
    restrict_lot_id integer,
    date_expected timestamp without time zone NOT NULL,
    procurement_id integer,
    create_uid integer,
    warehouse_id integer,
    inventory_id integer,
    partially_available boolean,
    propagate boolean,
    move_dest_id integer,
    date timestamp without time zone NOT NULL,
    scrapped boolean,
    write_uid integer,
    product_id integer NOT NULL,
    push_rule_id integer,
    name character varying NOT NULL,
    split_from integer,
    rule_id integer,
    location_dest_id integer NOT NULL,
    write_date timestamp without time zone,
    group_id integer,
    picking_id integer,
    purchase_line_id integer,
    to_refund_so boolean,
    workorder_id integer,
    consume_unbuild_id integer,
    is_done boolean,
    unit_factor double precision,
    bom_line_id integer,
    raw_material_production_id integer,
    quantity_done_store numeric,
    production_id integer,
    operation_id integer,
    unbuild_id integer,
    weight numeric,
    weight_uom_id integer NOT NULL,
    subproduct_id integer
);

CREATE TABLE public.stock_quant (
    id integer NOT NULL,
    create_date timestamp without time zone,
    qty double precision NOT NULL,
    propagated_from_id integer,
    package_id integer,
    cost double precision,
    lot_id integer,
    location_id integer NOT NULL,
    create_uid integer,
    reservation_id integer,
    company_id integer NOT NULL,
    owner_id integer,
    write_date timestamp without time zone,
    write_uid integer,
    product_id integer NOT NULL,
    packaging_type_id integer,
    negative_move_id integer,
    in_date timestamp without time zone,
    removal_date timestamp without time zone
);

CREATE TABLE public.report_vitt_arg_check_history_reports2_check_rep (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.report_vitt_route_report_routereport (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.report_vitt_sales_reports_reportvat (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.report_vitt_sales_reports_reportvatpl (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.report_zafran_route_routereport2 (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.res_afip (
    res_id integer NOT NULL,
    afip_id integer NOT NULL
);

CREATE TABLE public.res_bank (
    id integer NOT NULL,
    city character varying,
    fax character varying,
    name character varying NOT NULL,
    zip character varying,
    create_uid integer,
    country integer,
    street2 character varying,
    bic character varying,
    phone character varying,
    state integer,
    street character varying,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    write_uid integer,
    email character varying
);

CREATE TABLE public.res_company_tabla_ganancias_rel (
    company_id integer NOT NULL,
    regimen_id integer NOT NULL
);

CREATE TABLE public.res_company_users_rel (
    cid integer NOT NULL,
    user_id integer NOT NULL
);

CREATE TABLE public.res_config (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.res_config_installer (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.res_config_settings (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.res_config_woo_instance (
    id integer NOT NULL,
    create_uid integer,
    is_image_url boolean,
    name character varying,
    country_id integer NOT NULL,
    verify_ssl boolean,
    admin_username character varying,
    write_uid integer,
    consumer_secret character varying NOT NULL,
    host character varying NOT NULL,
    woo_version character varying,
    admin_password character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    is_latest boolean,
    consumer_key character varying NOT NULL
);

CREATE TABLE public.res_country (
    id integer NOT NULL,
    currency_id integer,
    code character varying(2),
    name character varying NOT NULL,
    create_uid integer,
    address_format text,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    phone_code integer,
    cuit_otro character varying(11),
    afip_code character varying(3),
    cuit_fisica character varying(11),
    cuit_juridica character varying(11)
);

CREATE TABLE public.res_country_group (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.res_country_group_pricelist_rel (
    pricelist_id integer NOT NULL,
    res_country_group_id integer NOT NULL
);

CREATE TABLE public.res_country_res_country_group_rel (
    res_country_id integer NOT NULL,
    res_country_group_id integer NOT NULL
);

CREATE TABLE public.res_country_state (
    id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    country_id integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    afip_code character varying(2)
);

CREATE TABLE public.res_currency (
    id integer NOT NULL,
    name character varying NOT NULL,
    symbol character varying NOT NULL,
    create_uid integer,
    rounding numeric,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    "position" character varying,
    create_date timestamp without time zone,
    afip_code character varying(4),
    inverse_rate numeric
);

CREATE TABLE public.res_font (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    family character varying NOT NULL,
    write_uid integer,
    create_date timestamp without time zone,
    mode character varying NOT NULL,
    write_date timestamp without time zone,
    path character varying NOT NULL
);

CREATE TABLE public.res_groups (
    id integer NOT NULL,
    comment text,
    create_uid integer,
    color integer,
    share boolean,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    category_id integer,
    name character varying NOT NULL,
    is_portal boolean
);

CREATE TABLE public.res_groups_action_rel (
    uid integer NOT NULL,
    gid integer NOT NULL
);

CREATE TABLE public.res_groups_implied_rel (
    gid integer NOT NULL,
    hid integer NOT NULL
);

CREATE TABLE public.res_groups_report_rel (
    uid integer NOT NULL,
    gid integer NOT NULL
);

CREATE TABLE public.res_groups_users_rel (
    gid integer NOT NULL,
    uid integer NOT NULL
);

CREATE TABLE public.res_lang (
    id integer NOT NULL,
    name character varying NOT NULL,
    code character varying NOT NULL,
    date_format character varying NOT NULL,
    direction character varying NOT NULL,
    create_uid integer,
    thousands_sep character varying,
    translatable boolean,
    write_uid integer,
    time_format character varying NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    decimal_point character varying NOT NULL,
    active boolean,
    iso_code character varying,
    "grouping" character varying NOT NULL
);

CREATE TABLE public.res_partner_afip_activity_rel (
    partner_id integer NOT NULL,
    afip_activity_id integer NOT NULL
);

CREATE TABLE public.res_partner_afip_tax_rel (
    partner_id integer NOT NULL,
    afip_tax_id integer NOT NULL
);

CREATE TABLE public.res_partner_arba_alicuot (
    id integer NOT NULL,
    numero_comprobante character varying,
    grupo_retencion character varying,
    codigo_hash character varying,
    create_date timestamp without time zone,
    alicuota_retencion double precision,
    grupo_percepcion character varying,
    create_uid integer,
    company_id integer NOT NULL,
    alicuota_percepcion double precision,
    write_uid integer,
    from_date date,
    to_date date,
    write_date timestamp without time zone,
    partner_id integer NOT NULL,
    service character varying
);

CREATE TABLE public.res_partner_bank (
    id integer NOT NULL,
    create_uid integer,
    sequence integer,
    company_id integer,
    bank_id integer,
    currency_id integer,
    write_date timestamp without time zone,
    sanitized_acc_number character varying,
    create_date timestamp without time zone,
    write_uid integer,
    partner_id integer,
    acc_number character varying NOT NULL,
    show_onprint boolean,
    cbu character varying,
    cbu_alias character varying(25),
    use_mipymesf boolean
);

CREATE TABLE public.res_partner_category (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    create_uid integer,
    name character varying NOT NULL,
    color integer,
    write_uid integer,
    parent_id integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.res_partner_document_type_rel (
    partner_id integer NOT NULL,
    document_type_id integer NOT NULL
);

CREATE TABLE public.res_partner_id_category (
    id integer NOT NULL,
    create_uid integer,
    code character varying(16) NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    validation_code text,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    sequence integer NOT NULL,
    afip_code integer NOT NULL,
    arciba_doc_code character varying(1)
);

CREATE TABLE public.res_partner_id_number (
    id integer NOT NULL,
    comment text,
    status character varying,
    partner_issued_id integer,
    name character varying NOT NULL,
    create_uid integer,
    valid_until date,
    date_issued date,
    write_uid integer,
    valid_from date,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone,
    category_id integer NOT NULL,
    partner_id integer NOT NULL,
    place_issuance character varying,
    sequence integer NOT NULL
);

CREATE TABLE public.res_partner_market (
    id integer,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone,
    categ_id integer
);

CREATE TABLE public.res_partner_res_partner_category_rel (
    category_id integer NOT NULL,
    partner_id integer NOT NULL
);

CREATE TABLE public.res_partner_title (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    shortcut character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.res_partner_update_fields (
    update_id integer NOT NULL,
    field_id integer NOT NULL
);

CREATE TABLE public.res_partner_update_from_padron_field (
    id integer NOT NULL,
    create_uid integer,
    old_value character varying,
    wizard_id integer,
    write_uid integer,
    field character varying,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    new_value character varying
);

CREATE TABLE public.res_partner_update_from_padron_wizard (
    id integer NOT NULL,
    create_uid integer,
    write_date timestamp without time zone,
    update_constancia boolean,
    title_case boolean,
    write_uid integer,
    state character varying NOT NULL,
    create_date timestamp without time zone,
    partner_id integer
);

CREATE TABLE public.res_request_link (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    object character varying NOT NULL,
    write_uid integer,
    priority integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.res_users (
    id integer NOT NULL,
    active boolean DEFAULT true,
    login character varying NOT NULL,
    password character varying,
    company_id integer NOT NULL,
    partner_id integer NOT NULL,
    create_date timestamp without time zone,
    share boolean,
    write_uid integer,
    create_uid integer,
    action_id integer,
    write_date timestamp without time zone,
    signature text,
    password_crypt character varying,
    alias_id integer,
    sale_team_id integer,
    target_sales_done integer,
    target_sales_won integer,
    target_sales_invoiced integer,
    lock_date_bypass boolean
);

CREATE TABLE public.res_users_log (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.resource_calendar (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    company_id integer,
    write_uid integer,
    manager integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.resource_calendar_attendance (
    id integer NOT NULL,
    dayofweek character varying NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    date_from date,
    write_uid integer,
    create_date timestamp without time zone,
    hour_from double precision NOT NULL,
    hour_to double precision NOT NULL,
    write_date timestamp without time zone,
    date_to date,
    calendar_id integer NOT NULL
);

CREATE TABLE public.resource_calendar_leaves (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    resource_id integer,
    date_from timestamp without time zone NOT NULL,
    company_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    date_to timestamp without time zone NOT NULL,
    calendar_id integer
);

CREATE TABLE public.resource_resource (
    id integer NOT NULL,
    create_uid integer,
    time_efficiency double precision NOT NULL,
    code character varying,
    user_id integer,
    name character varying NOT NULL,
    company_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    active boolean,
    calendar_id integer,
    resource_type character varying NOT NULL
);

CREATE TABLE public.rule_group_rel (
    rule_group_id integer NOT NULL,
    group_id integer NOT NULL
);

CREATE TABLE public.sale_advance_payment_inv (
    id integer NOT NULL,
    count integer,
    create_uid integer,
    product_id integer,
    advance_payment_method character varying NOT NULL,
    write_uid integer,
    amount numeric,
    write_date timestamp without time zone,
    deposit_account_id integer,
    create_date timestamp without time zone
);

CREATE TABLE public.sale_config_settings (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    group_use_lead integer,
    module_crm_voip boolean,
    module_website_sign boolean,
    generate_sales_team_alias boolean,
    alias_prefix character varying,
    alias_domain character varying,
    sale_show_tax character varying NOT NULL,
    deposit_product_id_setting integer,
    company_id integer NOT NULL,
    sale_pricelist_setting character varying NOT NULL,
    group_display_incoterm integer,
    group_pricelist_item boolean,
    group_product_variant integer,
    group_warning_sale integer,
    module_website_quote integer,
    default_invoice_policy character varying,
    group_sale_layout integer,
    group_product_pricelist boolean,
    group_uom integer,
    group_sale_pricelist boolean,
    group_discount_per_so_line integer,
    module_sale_margin integer,
    auto_done_setting integer,
    module_website_sale_digital boolean,
    group_show_price_total boolean,
    group_show_price_subtotal boolean,
    group_sale_delivery_address integer,
    module_sale_contract boolean,
    module_sale_order_dates integer,
    module_delivery integer,
    group_mrp_properties integer,
    group_route_so_lines integer,
    default_picking_policy integer,
    keep_exchange_rate boolean,
    group_use_manual_exchange_rate boolean
);

CREATE TABLE public.sale_layout_category (
    id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer NOT NULL,
    write_uid integer,
    pagebreak boolean,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    subtotal boolean
);

CREATE TABLE public.sale_order (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    write_uid integer,
    team_id integer,
    client_order_ref character varying,
    date_order timestamp without time zone NOT NULL,
    partner_id integer NOT NULL,
    note text,
    procurement_group_id integer,
    amount_untaxed numeric,
    message_last_post timestamp without time zone,
    company_id integer,
    amount_tax numeric,
    state character varying,
    pricelist_id integer NOT NULL,
    project_id integer,
    create_uid integer,
    confirmation_date timestamp without time zone,
    validity_date date,
    payment_term_id integer,
    write_date timestamp without time zone,
    partner_invoice_id integer NOT NULL,
    fiscal_position_id integer,
    amount_total numeric,
    invoice_status character varying,
    name character varying NOT NULL,
    partner_shipping_id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    opportunity_id integer,
    medium_id integer,
    source_id integer,
    picking_policy character varying NOT NULL,
    incoterm integer,
    warehouse_id integer NOT NULL,
    effective_date date,
    requested_date timestamp without time zone,
    commitment_date timestamp without time zone,
    carrier_id integer,
    invoice_shipping_on_delivery boolean,
    delivery_price double precision,
    transport_note text,
    freight_id integer,
    transport_company_id integer,
    manual_currency_rate_active boolean,
    manual_currency_rate numeric,
    auto_workflow_process_id integer,
    invoice_policy character varying,
    woo_order_number character varying,
    woo_customer_ip character varying,
    woo_trans_id character varying,
    woo_order_id character varying,
    woo_instance_id integer,
    payment_gateway_id integer,
    approved_user integer,
    approved_date timestamp without time zone,
    approvedf boolean,
    website_description text,
    quote_viewed boolean,
    require_payment integer,
    access_token character varying NOT NULL,
    template_id integer
);

CREATE TABLE public.sale_order_line (
    id integer ,
    create_date timestamp without time zone,
    product_uom integer ,
    price_unit numeric ,
    product_uom_qty numeric,
    price_subtotal numeric,
    write_uid integer,
    currency_id integer,
    price_reduce_taxexcl numeric,
    create_uid integer,
    price_tax numeric,
    qty_to_invoice numeric,
    customer_lead double precision,
    layout_category_sequence integer,
    company_id integer,
    state character varying ,
    order_partner_id integer,
    order_id integer ,
    qty_invoiced numeric,
    sequence integer,
    discount numeric,
    write_date timestamp without time zone,
    price_reduce numeric,
    qty_delivered numeric,
    layout_category_id integer,
    product_id integer ,
    price_reduce_taxinc numeric,
    price_total numeric,
    invoice_status character varying ,
    name text ,
    salesman_id integer,
    product_packaging integer,
    route_id integer,
    is_delivery boolean,
    woo_line_id character varying ,
    website_description text
);

CREATE TABLE public.sale_order_line_invoice_rel (
    invoice_line_id integer,
    order_line_id integer
);

CREATE TABLE public.sale_order_option (
    id integer NOT NULL,
    uom_id integer NOT NULL,
    create_uid integer,
    name text NOT NULL,
    line_id integer,
    order_id integer,
    price_unit numeric NOT NULL,
    sequence integer,
    discount numeric,
    website_description text,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    quantity numeric NOT NULL,
    layout_category_id integer,
    product_id integer
);

CREATE TABLE public.sale_order_tag_rel (
    order_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE public.sale_quote_line (
    id integer NOT NULL,
    create_uid integer,
    quote_id integer NOT NULL,
    product_id integer NOT NULL,
    sequence integer,
    product_uom_id integer NOT NULL,
    price_unit numeric NOT NULL,
    product_uom_qty numeric NOT NULL,
    discount numeric,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    write_uid integer,
    layout_category_id integer,
    name text NOT NULL
);

CREATE TABLE public.sale_quote_option (
    id integer NOT NULL,
    uom_id integer NOT NULL,
    create_uid integer,
    product_id integer NOT NULL,
    template_id integer NOT NULL,
    price_unit numeric NOT NULL,
    name text NOT NULL,
    discount numeric,
    website_description text,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    layout_category_id integer,
    quantity numeric NOT NULL
);

CREATE TABLE public.sale_quote_template (
    id integer NOT NULL,
    create_uid integer,
    website_description text,
    name character varying NOT NULL,
    write_uid integer,
    require_payment integer,
    note text,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    number_of_days integer,
    mail_template_id integer
);

CREATE TABLE public.sale_workflow_process_config_installer (
    id integer NOT NULL,
    create_uid integer,
    create_invoice boolean,
    sale_journal_id integer,
    name character varying(64),
    invoice_date_is_order_date boolean,
    picking_policy character varying,
    write_date timestamp without time zone,
    journal_id integer,
    register_payment boolean,
    create_date timestamp without time zone,
    invoice_policy character varying,
    validate_invoice boolean,
    validate_order boolean,
    write_uid integer,
    auto_check_availability boolean
);

CREATE TABLE public.sale_workflow_process_ept (
    id integer NOT NULL,
    create_uid integer,
    create_invoice boolean,
    sale_journal_id integer,
    name character varying(64),
    invoice_date_is_order_date boolean,
    picking_policy character varying,
    write_date timestamp without time zone,
    journal_id integer,
    register_payment boolean,
    create_date timestamp without time zone,
    invoice_policy character varying,
    validate_invoice boolean,
    validate_order boolean,
    write_uid integer,
    auto_check_availability boolean
);


CREATE TABLE public.setting_subtype_journal (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying(64),
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.sicore_codes (
    id integer NOT NULL,
    comment character varying(60),
    create_uid integer,
    create_date timestamp without time zone,
    name character varying(3),
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.sicore_extended (
    id integer NOT NULL,
    create_uid integer,
    excel_file2 bytea,
    file_name character varying(64),
    write_uid integer,
    excel_file bytea,
    write_date timestamp without time zone,
    file_name2 character varying(64),
    create_date timestamp without time zone
);

CREATE TABLE public.sicore_norm_codes (
    id integer NOT NULL,
    comment character varying(300),
    create_uid integer,
    name character varying(2),
    write_uid integer,
    write_date timestamp without time zone,
    operation_type character varying,
    create_date timestamp without time zone,
    tax_scope character varying NOT NULL
);

CREATE TABLE public.sire_extended (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    file_name character varying(64),
    write_uid integer,
    excel_file bytea,
    write_date timestamp without time zone
);

CREATE TABLE public.stock_backorder_confirmation (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    pick_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_change_product_qty (
    id integer NOT NULL,
    create_uid integer,
    product_id integer NOT NULL,
    write_uid integer,
    product_tmpl_id integer NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    lot_id integer,
    new_quantity numeric NOT NULL,
    location_id integer NOT NULL
);

CREATE TABLE public.stock_change_standard_price (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    new_price numeric NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    counterpart_account_id integer NOT NULL
);

CREATE TABLE public.stock_config_settings (
    id integer NOT NULL,
    create_date timestamp without time zone,
    module_stock_calendar integer,
    module_stock_barcode boolean,
    module_stock_picking_wave integer,
    company_id integer NOT NULL,
    group_stock_tracking_lot integer,
    group_product_variant integer,
    create_uid integer,
    group_warning_stock integer,
    module_delivery_temando boolean,
    group_stock_production_lot integer,
    group_stock_multi_warehouses boolean,
    group_stock_tracking_owner integer,
    module_delivery_usps boolean,
    module_stock_dropshipping integer,
    module_quality boolean,
    module_procurement_jit integer,
    group_stock_packaging integer,
    write_date timestamp without time zone,
    module_delivery_fedex boolean,
    write_uid integer,
    decimal_precision integer,
    group_uom integer,
    warehouse_and_location_usage_level integer,
    module_delivery_ups boolean,
    module_product_expiry integer,
    group_stock_multi_locations boolean,
    group_stock_adv_location integer,
    module_delivery_dhl boolean,
    module_stock_landed_costs integer,
    group_stock_inventory_valuation integer
);

CREATE TABLE public.stock_fixed_putaway_strat (
    id integer NOT NULL,
    create_uid integer,
    putaway_id integer NOT NULL,
    fixed_location_id integer NOT NULL,
    sequence integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    category_id integer NOT NULL
);

CREATE TABLE public.stock_production_lot (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    create_uid integer,
    message_last_post timestamp without time zone,
    ref character varying,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    name character varying NOT NULL,
    product_uom_id integer,
    life_date timestamp without time zone,
    removal_date timestamp without time zone,
    alert_date timestamp without time zone,
    use_date timestamp without time zone,
    origin character varying(40),
    variety character varying(40),
    brand character varying(40)
);

CREATE TABLE public.stock_quant_move_rel (
    move_id integer NOT NULL,
    quant_id integer NOT NULL
);

CREATE TABLE public.stock_immediate_transfer (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    pick_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_incoterms (
    id integer NOT NULL,
    create_uid integer,
    code character varying(3) NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_inventory (
    id integer NOT NULL,
    create_date timestamp without time zone,
    exhausted boolean,
    write_uid integer,
    package_id integer,
    lot_id integer,
    partner_id integer,
    create_uid integer,
    location_id integer NOT NULL,
    company_id integer NOT NULL,
    state character varying,
    write_date timestamp without time zone,
    date timestamp without time zone NOT NULL,
    product_id integer,
    name character varying NOT NULL,
    filter character varying NOT NULL,
    category_id integer,
    accounting_date date
);

CREATE TABLE public.stock_inventory_line (
    id integer NOT NULL,
    theoretical_qty numeric,
    write_uid integer,
    package_id integer,
    product_qty numeric,
    create_date timestamp without time zone,
    product_code character varying,
    location_id integer NOT NULL,
    create_uid integer,
    location_name character varying,
    partner_id integer,
    company_id integer,
    product_name character varying,
    prodlot_name character varying,
    inventory_id integer,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    product_uom_id integer NOT NULL,
    prod_lot_id integer
);

CREATE TABLE public.stock_landed_cost (
    id integer NOT NULL,
    create_date timestamp without time zone,
    write_uid integer,
    create_uid integer,
    account_journal_id integer NOT NULL,
    account_move_id integer,
    message_last_post timestamp without time zone,
    state character varying,
    description text,
    name character varying,
    write_date timestamp without time zone,
    date date NOT NULL,
    amount_total numeric
);

CREATE TABLE public.stock_landed_cost_lines (
    id integer NOT NULL,
    create_uid integer,
    split_method character varying NOT NULL,
    product_id integer NOT NULL,
    price_unit numeric NOT NULL,
    name character varying,
    create_date timestamp without time zone,
    cost_id integer NOT NULL,
    write_date timestamp without time zone,
    write_uid integer,
    account_id integer
);

CREATE TABLE public.stock_landed_cost_stock_picking_rel (
    stock_landed_cost_id integer NOT NULL,
    stock_picking_id integer NOT NULL
);

CREATE TABLE public.stock_location_path (
    id integer NOT NULL,
    location_from_id integer NOT NULL,
    create_uid integer,
    route_sequence integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    location_dest_id integer NOT NULL,
    sequence integer,
    auto character varying NOT NULL,
    company_id integer,
    warehouse_id integer,
    delay integer,
    route_id integer,
    propagate boolean,
    picking_type_id integer NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    write_uid integer
);

CREATE TABLE public.stock_location_route (
    id integer NOT NULL,
    supplier_wh_id integer,
    create_uid integer,
    name character varying NOT NULL,
    sequence integer,
    warehouse_selectable boolean,
    write_date timestamp without time zone,
    company_id integer,
    supplied_wh_id integer,
    product_selectable boolean,
    product_categ_selectable boolean,
    active boolean,
    create_date timestamp without time zone,
    write_uid integer,
    sale_selectable boolean
);

CREATE TABLE public.stock_location_route_categ (
    categ_id integer NOT NULL,
    route_id integer NOT NULL
);

CREATE TABLE public.stock_location_route_move (
    move_id integer NOT NULL,
    route_id integer NOT NULL
);

CREATE TABLE public.stock_location_route_procurement (
    procurement_id integer NOT NULL,
    route_id integer NOT NULL
);

CREATE TABLE public.stock_location_stock_production_lot_rel (
    stock_production_lot_id integer NOT NULL,
    stock_location_id integer NOT NULL
);

CREATE TABLE public.stock_location_supply (
    id integer NOT NULL,
    create_uid integer,
    picking_type_id integer NOT NULL,
    write_uid integer,
    record_date date NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    supply_date date NOT NULL,
    location_id integer NOT NULL
);

CREATE TABLE public.stock_move_lots (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    product_id integer,
    done_wo boolean,
    production_id integer,
    done_move boolean,
    quantity double precision,
    write_uid integer,
    lot_produced_qty double precision,
    workorder_id integer,
    write_date timestamp without time zone,
    lot_id integer,
    lot_produced_id integer,
    move_id integer,
    quantity_done double precision
);

CREATE TABLE public.stock_move_operation_link (
    id integer NOT NULL,
    reserved_quant_id integer,
    qty double precision,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    operation_id integer NOT NULL,
    write_uid integer,
    create_uid integer,
    move_id integer NOT NULL
);

CREATE TABLE public.stock_pack_operation (
    id integer NOT NULL,
    create_date timestamp without time zone,
    result_package_id integer,
    write_uid integer,
    package_id integer,
    product_qty numeric NOT NULL,
    location_id integer NOT NULL,
    ordered_qty numeric,
    qty_done numeric,
    create_uid integer,
    fresh_record boolean,
    write_date timestamp without time zone,
    date timestamp without time zone NOT NULL,
    product_id integer,
    product_uom_id integer,
    location_dest_id integer NOT NULL,
    owner_id integer,
    picking_id integer NOT NULL,
    filter_location_id integer
);

CREATE TABLE public.stock_pack_operation_lot (
    id integer NOT NULL,
    create_uid integer,
    lot_name character varying,
    qty_todo double precision,
    qty double precision,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    operation_id integer,
    lot_id integer,
    write_uid integer,
    CONSTRAINT stock_pack_operation_lot_qty CHECK ((qty >= (0.0)::double precision))
);

CREATE TABLE public.stock_picking (
    id integer NOT NULL,
    origin character varying,
    date_done timestamp without time zone,
    write_uid integer,
    recompute_pack_op boolean,
    launch_pack_operations boolean,
    location_id integer NOT NULL,
    priority character varying,
    picking_type_id integer NOT NULL,
    partner_id integer,
    move_type character varying NOT NULL,
    message_last_post timestamp without time zone,
    company_id integer NOT NULL,
    note text,
    state character varying,
    owner_id integer,
    backorder_id integer,
    create_uid integer,
    min_date timestamp without time zone,
    printed boolean,
    write_date timestamp without time zone,
    date timestamp without time zone,
    group_id integer,
    name character varying,
    create_date timestamp without time zone,
    location_dest_id integer NOT NULL,
    max_date timestamp without time zone,
    wave_id integer,
    carrier_tracking_ref character varying,
    number_of_packages integer,
    carrier_id integer,
    weight numeric,
    weight_uom_id integer NOT NULL,
    volume double precision,
    carrier_price double precision,
    transport_company_id integer,
    transport_note text,
    freight_id integer,
    canceled_in_woo boolean,
    updated_in_woo boolean,
    woo_instance_id integer,
    is_woo_delivery_order boolean,
    del_sequence integer
);

CREATE TABLE public.stock_picking_lines_wizard (
    id integer NOT NULL,
    create_uid integer,
    name character varying,
    spw_id integer,
    write_uid integer,
    create_date timestamp without time zone,
    transport_company_id integer,
    write_date timestamp without time zone,
    delivery_sequence integer,
    partner_id integer
);

CREATE TABLE public.stock_picking_to_wave (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    wave_id integer NOT NULL
);

CREATE TABLE public.stock_picking_wave (
    id integer NOT NULL,
    user_id integer,
    name character varying NOT NULL,
    create_uid integer,
    message_last_post timestamp without time zone,
    write_uid integer,
    state character varying NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_picking_wizard (
    id integer NOT NULL,
    create_uid integer,
    z_ids character varying,
    freight_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    date date,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_quant_consume_rel (
    consume_quant_id integer NOT NULL,
    produce_quant_id integer NOT NULL
);

CREATE TABLE public.stock_quant_package (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    parent_id integer,
    write_date timestamp without time zone,
    packaging_id integer,
    shipping_weight double precision
);

CREATE TABLE public.stock_return_picking (
    id integer NOT NULL,
    move_dest_exists boolean,
    original_location_id integer,
    create_uid integer,
    parent_location_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    location_id integer
);

CREATE TABLE public.stock_return_picking_line (
    id integer NOT NULL,
    create_uid integer,
    product_id integer NOT NULL,
    wizard_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    move_id integer,
    quantity numeric NOT NULL,
    to_refund_so boolean
);

CREATE TABLE public.stock_route_product (
    product_id integer NOT NULL,
    route_id integer NOT NULL
);

CREATE TABLE public.stock_route_warehouse (
    route_id integer NOT NULL,
    warehouse_id integer NOT NULL
);

CREATE TABLE public.stock_scrap (
    id integer NOT NULL,
    origin character varying,
    create_date timestamp without time zone,
    write_uid integer,
    package_id integer,
    scrap_qty double precision NOT NULL,
    lot_id integer,
    location_id integer NOT NULL,
    create_uid integer,
    scrap_location_id integer,
    state character varying,
    owner_id integer,
    date_expected timestamp without time zone,
    write_date timestamp without time zone,
    move_id integer,
    product_id integer NOT NULL,
    name character varying NOT NULL,
    product_uom_id integer NOT NULL,
    picking_id integer,
    workorder_id integer,
    production_id integer
);

CREATE TABLE public.stock_traceability_report (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.stock_valuation_adjustment_lines (
    id integer NOT NULL,
    additional_landed_cost numeric,
    cost_line_id integer,
    name character varying,
    weight numeric,
    create_uid integer,
    former_cost numeric,
    write_uid integer,
    volume numeric,
    final_cost numeric,
    cost_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    former_cost_per_unit numeric,
    quantity numeric NOT NULL,
    move_id integer,
    product_id integer NOT NULL
);

CREATE TABLE public.stock_warehouse (
    id integer NOT NULL,
    code character varying(5) NOT NULL,
    create_date timestamp without time zone,
    lot_stock_id integer NOT NULL,
    wh_pack_stock_loc_id integer,
    reception_route_id integer,
    pick_type_id integer,
    crossdock_route_id integer,
    partner_id integer,
    create_uid integer,
    delivery_route_id integer,
    wh_input_stock_loc_id integer,
    company_id integer NOT NULL,
    reception_steps character varying NOT NULL,
    delivery_steps character varying NOT NULL,
    view_location_id integer NOT NULL,
    wh_qc_stock_loc_id integer,
    default_resupply_wh_id integer,
    pack_type_id integer,
    wh_output_stock_loc_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean,
    mto_pull_id integer,
    name character varying NOT NULL,
    in_type_id integer,
    out_type_id integer,
    int_type_id integer,
    buy_pull_id integer,
    buy_to_resupply boolean,
    manu_type_id integer,
    manufacture_to_resupply boolean,
    manufacture_pull_id integer
);

CREATE TABLE public.stock_warehouse_orderpoint (
    id integer NOT NULL,
    product_max_qty numeric NOT NULL,
    create_uid integer,
    product_min_qty numeric NOT NULL,
    qty_multiple numeric NOT NULL,
    create_date timestamp without time zone,
    product_id integer NOT NULL,
    company_id integer NOT NULL,
    lead_days integer,
    write_uid integer,
    lead_type character varying NOT NULL,
    write_date timestamp without time zone,
    active boolean,
    group_id integer,
    warehouse_id integer NOT NULL,
    location_id integer NOT NULL,
    name character varying NOT NULL,
    CONSTRAINT stock_warehouse_orderpoint_qty_multiple_check CHECK ((qty_multiple >= (0)::numeric))
);

CREATE TABLE public.stock_wh_resupply_table (
    supplied_wh_id integer NOT NULL,
    supplier_wh_id integer NOT NULL
);

CREATE TABLE public.supp_wiz_rel (
    wiz integer NOT NULL,
    supp integer NOT NULL
);

CREATE TABLE public.supplier_invoice_lines (
    id integer NOT NULL,
    create_uid integer,
    partner_id integer,
    total_amount double precision NOT NULL,
    invoice_id integer NOT NULL,
    payment_diff double precision,
    amount_to_pay double precision,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    supplier_wizard_id integer,
    payment_method_id integer
);

CREATE TABLE public.tax_adjustments_wizard (
    id integer NOT NULL,
    create_uid integer,
    credit_account_id integer NOT NULL,
    journal_id integer NOT NULL,
    write_uid integer,
    company_currency_id integer,
    date date NOT NULL,
    amount numeric NOT NULL,
    write_date timestamp without time zone,
    reason character varying NOT NULL,
    create_date timestamp without time zone,
    debit_account_id integer NOT NULL,
    tax_id integer NOT NULL
);

CREATE TABLE public.third_checks_states (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    states character varying,
    write_date timestamp without time zone
);

CREATE TABLE public.transaction_log_ept (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    mismatch_details boolean,
    write_uid integer,
    write_date timestamp without time zone,
    message text,
    type character varying
);

CREATE TABLE public.utm_campaign (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.utm_medium (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    active boolean
);

CREATE TABLE public.utm_source (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.validate_account_move (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.vendor_ledger_to_partners (
    currencies_vendor_ledger_context_report_id integer NOT NULL,
    res_partner_id integer NOT NULL
);

CREATE TABLE public.vendor_transection_context_report (
    id integer NOT NULL,
    analytic_manager_id integer NOT NULL,
    periods_number integer,
    create_date timestamp without time zone,
    date_to_cmp date,
    write_uid integer,
    partner_id integer,
    create_uid integer,
    date_from date,
    footnotes_manager_id integer NOT NULL,
    next_footnote_number integer NOT NULL,
    all_entries boolean,
    date_filter character varying,
    write_date timestamp without time zone,
    date_to date,
    cash_basis boolean,
    multicompany_manager_id integer NOT NULL,
    date_filter_cmp character varying,
    hierarchy_3 integer,
    summary character varying,
    date_from_cmp date,
    filter_unfold_all boolean,
    new_filter_unfold_all boolean,
    account_manager_id integer NOT NULL,
    balance character varying,
    initial_balance character varying
);

CREATE TABLE public.vendor_transection_context_to_payment (
    vendor_transection_context_report_id integer NOT NULL,
    account_payment_group_id integer NOT NULL
);

CREATE TABLE public.vitt_sales_reports_reportciti (
    id integer NOT NULL,
    create_uid integer,
    date_from date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportsicore (
    id integer NOT NULL,
    create_uid integer,
    date_from date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportsifere (
    id integer NOT NULL,
    create_uid integer,
    wh_id integer,
    date_from date NOT NULL,
    jurisd_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportsifere_vtas (
    id integer NOT NULL,
    create_uid integer,
    wh_id integer,
    date_from date NOT NULL,
    jurisd_id integer,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportsire (
    id integer NOT NULL,
    create_uid integer,
    wh_id integer,
    date_from date NOT NULL,
    write_uid integer,
    cupaym boolean,
    vepaym boolean,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportvat (
    id integer NOT NULL,
    create_uid integer,
    det_level character varying,
    date_from date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    vatcode_id integer,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_sales_reports_reportvatpl (
    id integer NOT NULL,
    create_uid integer,
    det_level character varying,
    date_from date NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    date_to date NOT NULL,
    vatcode_id integer,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_val2words_config_numbers (
    id integer NOT NULL,
    create_uid integer,
    config_id integer NOT NULL,
    company_id integer NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    numtext integer NOT NULL,
    valtext character varying
);

CREATE TABLE public.vitt_val2words_config_text (
    id integer NOT NULL,
    bill10 character varying,
    create_date timestamp without time zone,
    endtext character varying,
    zero character varying,
    dec_words character varying,
    cutdecimals boolean,
    create_uid integer,
    thou10 character varying,
    houn1single character varying,
    company_id integer NOT NULL,
    bill9 character varying,
    mill10 character varying,
    bill1 character varying,
    bill4 character varying,
    houn9 character varying,
    houn8 character varying,
    houn7 character varying,
    houn6 character varying,
    houn5 character varying,
    houn4 character varying,
    houn3 character varying,
    houn2 character varying,
    houn1 character varying,
    negative character varying,
    write_date timestamp without time zone,
    write_uid integer,
    mainpart character varying,
    name integer NOT NULL,
    mill9 character varying,
    mill4 character varying,
    mill1 character varying,
    print_currency character varying,
    thou1 character varying,
    decipart character varying,
    thou4 character varying,
    thou9 character varying
);

CREATE TABLE public.vitt_val2words_currency_names (
    id integer NOT NULL,
    create_uid integer,
    config_id integer NOT NULL,
    write_uid integer,
    currency_id integer,
    currency_name character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.vitt_val2words_language (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    description character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    name character varying NOT NULL
);

CREATE TABLE public.web_editor_converter_test (
    id integer NOT NULL,
    create_uid integer,
    selection integer,
    create_date timestamp without time zone,
    "binary" bytea,
    text text,
    "float" double precision,
    html text,
    "numeric" numeric,
    datetime timestamp without time zone,
    "char" character varying,
    selection_str character varying,
    write_date timestamp without time zone,
    many2one integer,
    date date,
    "integer" integer,
    write_uid integer
);

CREATE TABLE public.web_editor_converter_test_sub (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.web_planner (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    create_uid integer,
    name character varying NOT NULL,
    planner_application character varying NOT NULL,
    view_id integer NOT NULL,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    active boolean,
    tooltip_planner text
);

CREATE TABLE public.web_tour_tour (
    id integer NOT NULL,
    user_id integer,
    name character varying NOT NULL
);

CREATE TABLE public.website (
    id integer NOT NULL,
    domain character varying,
    create_date timestamp without time zone,
    social_linkedin character varying,
    cdn_filters text,
    social_facebook character varying,
    favicon bytea,
    google_analytics_key character varying,
    social_twitter character varying,
    social_youtube character varying,
    cdn_url character varying,
    create_uid integer,
    user_id integer,
    default_lang_code character varying,
    social_googleplus character varying,
    company_id integer,
    social_github character varying,
    default_lang_id integer NOT NULL,
    compress_html boolean,
    write_date timestamp without time zone,
    write_uid integer,
    cdn_activated boolean,
    name character varying
);

CREATE TABLE public.website_config_settings (
    id integer NOT NULL,
    create_date timestamp without time zone,
    website_id integer NOT NULL,
    google_maps_api_key character varying,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    module_website_version integer,
    module_website_form_editor integer
);

CREATE TABLE public.website_lang_rel (
    website_id integer NOT NULL,
    lang_id integer NOT NULL
);

CREATE TABLE public.website_menu (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    create_uid integer,
    name character varying NOT NULL,
    url character varying,
    sequence integer,
    write_uid integer,
    parent_id integer,
    new_window boolean,
    website_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.wh_wiz_rel (
    wiz integer NOT NULL,
    wh integer NOT NULL
);

CREATE TABLE public.wizard_digital_vat (
    id integer NOT NULL,
    "LIBRO_IVA_DIGITAL_COMPRAS_CBTE" boolean,
    create_uid integer,
    date_to date NOT NULL,
    "LIBRO_IVA_DIGITAL_COMPRAS_ALICUOTAS" boolean,
    "LIBRO_IVA_DIGITAL_VENTAS_ALICUOTAS" boolean,
    "LIBRO_IVA_DIGITAL_VENTAS_ANULADAS" boolean,
    "LIBRO_IVA_DIGITAL_VENTAS_CBTE" boolean,
    write_date timestamp without time zone,
    "LIBRO_IVA_DIGITAL_IMPORTACION_BIENES_ALICUOTA" boolean,
    "LIBRO_IVA_DIGITAL_COMPRAS_TurIVA_CBTE" boolean,
    create_date timestamp without time zone,
    write_uid integer,
    "LIBRO_IVA_DIGITAL_IMPORTACION_SERVICIOS_CREDITO_FISCAL" boolean,
    date_from date NOT NULL,
    "LIBRO_IVA_DIGITAL_VENTAS_TurIVA_CBTE" boolean
);

CREATE TABLE public.wizard_ir_model_menu_create (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.wizard_multi_charts_accounts (
    id integer NOT NULL,
    bank_account_code_prefix character varying,
    cash_account_code_prefix character varying,
    create_date timestamp without time zone,
    write_uid integer,
    currency_id integer NOT NULL,
    only_one_chart_template boolean,
    create_uid integer,
    complete_tax_set boolean,
    transfer_account_id integer NOT NULL,
    company_id integer NOT NULL,
    purchase_tax_rate double precision,
    write_date timestamp without time zone,
    sale_tax_rate double precision,
    code_digits integer NOT NULL,
    purchase_tax_id integer,
    sale_tax_id integer,
    chart_template_id integer NOT NULL
);

CREATE TABLE public.wizard_stock_history (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.wizard_valuation_history (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    date timestamp without time zone NOT NULL,
    choose_date boolean
);

CREATE TABLE public.wkf (
    id integer NOT NULL,
    name character varying NOT NULL,
    osv character varying NOT NULL,
    on_create boolean DEFAULT false,
    create_uid integer,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.wkf_activity (
    id integer NOT NULL,
    create_uid integer,
    kind character varying NOT NULL,
    name character varying NOT NULL,
    join_mode character varying NOT NULL,
    write_uid integer,
    flow_stop boolean,
    subflow_id integer,
    split_mode character varying NOT NULL,
    write_date timestamp without time zone,
    action text,
    create_date timestamp without time zone,
    signal_send character varying,
    action_id integer,
    wkf_id integer NOT NULL,
    flow_start boolean
);

CREATE TABLE public.wkf_instance (
    id integer NOT NULL,
    res_type character varying,
    uid integer,
    wkf_id integer,
    state character varying,
    res_id integer
);

CREATE TABLE public.wkf_transition (
    id integer NOT NULL,
    create_uid integer,
    sequence integer,
    write_uid integer,
    signal character varying,
    trigger_model character varying,
    create_date timestamp without time zone,
    act_from integer NOT NULL,
    act_to integer NOT NULL,
    write_date timestamp without time zone,
    trigger_expr_id character varying,
    group_id integer,
    condition character varying NOT NULL
);

CREATE TABLE public.wkf_triggers (
    id integer NOT NULL,
    instance_id integer,
    workitem_id integer NOT NULL,
    model character varying,
    res_id integer
);

CREATE TABLE public.wkf_witm_trans (
    inst_id integer NOT NULL,
    trans_id integer NOT NULL
);

CREATE TABLE public.wkf_workitem (
    id integer NOT NULL,
    act_id integer NOT NULL,
    inst_id integer NOT NULL,
    subflow_id integer,
    state character varying
);

CREATE TABLE public.woo_cancel_order_wizard (
    id integer NOT NULL,
    create_uid integer,
    date_ept date,
    journal_id integer,
    company_id integer,
    suggested_amount numeric,
    write_uid integer,
    amount numeric,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    message character varying,
    auto_create_refund boolean,
    inv_line_des character varying
);

CREATE TABLE public.woo_instance_ept (
    id integer NOT NULL,
    stock_field integer,
    order_auto_import boolean,
    color integer,
    country_id integer,
    last_inventory_update_time timestamp without time zone,
    payment_term_id integer,
    verify_ssl boolean,
    create_date timestamp without time zone,
    is_publish boolean,
    fee_line_id integer,
    is_set_image boolean,
    warehouse_id integer,
    company_id integer NOT NULL,
    name character varying(120) NOT NULL,
    discount_product_id integer,
    order_auto_update boolean,
    state character varying,
    lang_id integer,
    auto_import_product boolean,
    admin_password character varying,
    pricelist_id integer,
    consumer_key character varying NOT NULL,
    create_uid integer,
    is_show_debug_info boolean,
    write_uid integer,
    attribute_type character varying,
    is_set_stock boolean,
    variation boolean,
    section_id integer,
    consumer_secret character varying NOT NULL,
    write_date timestamp without time zone,
    is_set_price boolean,
    inventory_adjustment_id integer,
    is_latest boolean,
    fiscal_position_id integer,
    is_image_url boolean,
    visible boolean,
    host character varying NOT NULL,
    admin_username character varying,
    order_prefix character varying(10),
    sync_images_with_product boolean,
    woo_version character varying,
    sync_price_with_product boolean,
    stock_auto_export boolean
);

CREATE TABLE public.woo_config_settings (
    id integer NOT NULL,
    woo_instance_id integer,
    stock_field integer,
    order_auto_import boolean,
    update_stock_next_execution timestamp without time zone,
    write_uid integer,
    create_date timestamp without time zone,
    order_update_next_execution timestamp without time zone,
    order_update_interval_number integer,
    is_publish boolean,
    fee_line_id integer,
    update_stock_user_id integer,
    is_set_image boolean,
    sync_price_with_product boolean,
    country_id integer,
    company_id integer,
    order_update_user_id integer,
    order_auto_update boolean,
    discount_product_id integer,
    order_import_interval_type character varying,
    lang_id integer,
    auto_import_product boolean,
    update_stock_interval_number integer,
    pricelist_id integer,
    create_uid integer,
    update_stock_interval_type character varying,
    is_set_stock boolean,
    section_id integer,
    payment_term_id integer,
    write_date timestamp without time zone,
    is_set_price boolean,
    sync_images_with_product boolean,
    warehouse_id integer,
    fiscal_position_id integer,
    order_import_next_execution timestamp without time zone,
    is_show_debug_info boolean,
    order_import_user_id integer,
    order_prefix character varying(10),
    order_import_interval_number integer,
    order_update_interval_type character varying,
    stock_auto_export boolean
);

CREATE TABLE public.woo_config_settings_order_status_rel (
    woo_config_id integer NOT NULL,
    status_id integer NOT NULL
);

CREATE TABLE public.woo_coupons_ept (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    code character varying NOT NULL,
    create_date timestamp without time zone,
    maximum_amount double precision,
    coupon_id integer,
    individual_use boolean,
    limit_usage_to_x_items integer,
    create_uid integer,
    free_shipping boolean,
    exported_in_woo boolean,
    usage_count integer,
    usage_limit_per_user integer,
    description text,
    used_by character varying,
    exclude_sale_items boolean,
    discount_type character varying,
    expiry_date date,
    write_date timestamp without time zone,
    date_created timestamp without time zone,
    write_uid integer,
    usage_limit integer,
    date_modified timestamp without time zone,
    email_restrictions character varying,
    amount double precision,
    minimum_amount double precision
);

CREATE TABLE public.woo_installer_order_status_rel (
    installer_id integer NOT NULL,
    status_id integer NOT NULL
);

CREATE TABLE public.woo_instance_config_installer (
    id integer NOT NULL,
    create_uid integer,
    is_image_url boolean,
    name character varying,
    country_id integer NOT NULL,
    verify_ssl boolean,
    admin_username character varying,
    write_uid integer,
    consumer_secret character varying NOT NULL,
    host character varying NOT NULL,
    woo_version character varying,
    admin_password character varying,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    is_latest boolean,
    consumer_key character varying NOT NULL
);

CREATE TABLE public.woo_instance_financial_status_config_installer (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_uid integer,
    payment_gateway_id integer NOT NULL,
    financial_status character varying NOT NULL,
    write_uid integer,
    auto_workflow_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.woo_instance_general_config_installer (
    id integer NOT NULL,
    woo_instance_id integer,
    stock_field integer,
    order_auto_import boolean,
    update_stock_next_execution timestamp without time zone,
    write_uid integer,
    create_date timestamp without time zone,
    order_update_next_execution timestamp without time zone,
    order_update_interval_number integer,
    is_publish boolean,
    fee_line_id integer,
    update_stock_user_id integer,
    is_set_image boolean,
    sync_price_with_product boolean,
    country_id integer,
    company_id integer,
    order_update_user_id integer,
    order_auto_update boolean,
    discount_product_id integer,
    order_import_interval_type character varying,
    lang_id integer,
    auto_import_product boolean,
    update_stock_interval_number integer,
    pricelist_id integer,
    create_uid integer,
    update_stock_interval_type character varying,
    is_set_stock boolean,
    section_id integer,
    payment_term_id integer,
    write_date timestamp without time zone,
    is_set_price boolean,
    sync_images_with_product boolean,
    warehouse_id integer,
    fiscal_position_id integer,
    order_import_next_execution timestamp without time zone,
    order_import_user_id integer,
    order_prefix character varying(10),
    order_import_interval_number integer,
    order_update_interval_type character varying,
    stock_auto_export boolean
);

CREATE TABLE public.woo_instance_import_export_rel (
    process_id integer NOT NULL,
    woo_instance_id integer NOT NULL
);

CREATE TABLE public.woo_instance_order_status_rel (
    instance_id integer NOT NULL,
    status_id integer NOT NULL
);

CREATE TABLE public.woo_payment_gateway (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_uid integer,
    code character varying NOT NULL,
    name character varying NOT NULL,
    write_uid integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.woo_process_import_export (
    id integer NOT NULL,
    create_date timestamp without time zone,
    sync_woo_coupons boolean,
    is_update_order_status boolean,
    is_update_image boolean,
    write_uid integer,
    publish boolean,
    is_unpublish_products boolean,
    update_image_in_product_export boolean,
    create_uid integer,
    sync_product_tags_from_woo boolean,
    sync_price_with_product boolean,
    is_update_coupon boolean,
    is_update_product_tags boolean,
    is_update_products boolean,
    is_export_products boolean,
    is_export_coupons boolean,
    is_import_orders boolean,
    update_image_in_product_update boolean,
    sync_product_category_from_woo boolean,
    is_publish_products boolean,
    is_update_price boolean,
    update_stock_in_product boolean,
    sync_attributes boolean,
    is_export_product_tags boolean,
    write_date timestamp without time zone,
    sync_images_with_product boolean,
    is_import_stock boolean,
    update_price_in_product boolean,
    is_export_product_categ boolean,
    sync_product_from_woo boolean,
    is_update_stock boolean,
    is_import_customers boolean,
    is_update_product_categ boolean
);

CREATE TABLE public.woo_product_attribute_ept (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_uid integer,
    order_by character varying,
    name character varying NOT NULL,
    exported_in_woo boolean,
    attribute_type character varying,
    has_archives boolean,
    create_date timestamp without time zone,
    attribute_id integer NOT NULL,
    write_date timestamp without time zone,
    write_uid integer,
    woo_attribute_id character varying,
    slug character varying
);

CREATE TABLE public.woo_product_attribute_term_ept (
    id integer NOT NULL,
    count integer,
    woo_instance_id integer NOT NULL,
    description character varying,
    exported_in_woo boolean,
    create_uid integer,
    attribute_value_id integer NOT NULL,
    attribute_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    woo_attribute_id character varying,
    slug character varying,
    woo_attribute_term_id character varying,
    name character varying NOT NULL
);

CREATE TABLE public.woo_product_categ_ept (
    id integer NOT NULL,
    parent_left integer,
    parent_right integer,
    woo_instance_id integer NOT NULL,
    create_date timestamp without time zone,
    image bytea,
    write_uid integer,
    create_uid integer,
    exported_in_woo boolean,
    parent_id integer,
    description character varying,
    response_url character varying(600),
    write_date timestamp without time zone,
    woo_categ_id integer,
    slug character varying,
    name character varying NOT NULL,
    url character varying(600),
    display character varying
);

CREATE TABLE public.woo_product_image_ept (
    id integer NOT NULL,
    woo_instance_id integer,
    create_uid integer,
    sequence integer,
    url character varying(600),
    image bytea,
    response_url character varying(600),
    write_uid integer,
    woo_product_tmpl_id integer,
    woo_image_id integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);

CREATE TABLE public.woo_product_product_ept (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_date timestamp without time zone,
    updated_at timestamp without time zone,
    write_uid integer,
    woo_template_id integer NOT NULL,
    variant_id character varying,
    create_uid integer,
    exported_in_woo boolean,
    woo_variant_url character varying(600),
    woo_image_id character varying,
    response_url character varying(600),
    fix_stock_type character varying,
    write_date timestamp without time zone,
    product_id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    fix_stock_value numeric,
    default_code character varying
);

CREATE TABLE public.woo_product_template_ept (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_date timestamp without time zone,
    updated_at timestamp without time zone,
    write_uid integer,
    woo_tmpl_id character varying,
    create_uid integer,
    exported_in_woo boolean,
    product_tmpl_id integer NOT NULL,
    short_description text,
    website_published boolean,
    description text,
    total_sync_variants integer,
    write_date timestamp without time zone,
    taxable boolean,
    name character varying,
    created_at timestamp without time zone,
    total_variants_in_woo integer
);

CREATE TABLE public.woo_product_tmpl_exclude_product_rel (
    exclude_product_ids integer NOT NULL,
    woo_product_ids integer NOT NULL
);

CREATE TABLE public.woo_product_tmpl_product_rel (
    product_ids integer NOT NULL,
    woo_product_ids integer NOT NULL
);

CREATE TABLE public.woo_req_history_ept (
    id integer NOT NULL,
    woo_instance_id integer,
    create_uid integer,
    write_date timestamp without time zone,
    url text,
    res text,
    req text,
    write_uid integer,
    req_time character varying,
    res_time character varying,
    create_date timestamp without time zone,
    type integer
);

CREATE TABLE public.woo_req_type_ept (
    id integer NOT NULL,
    create_uid integer,
    create_date timestamp without time zone,
    name character varying,
    write_uid integer,
    write_date timestamp without time zone
);

CREATE TABLE public.woo_sale_auto_workflow_configuration (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_uid integer,
    payment_gateway_id integer NOT NULL,
    financial_status character varying NOT NULL,
    write_uid integer,
    auto_workflow_id integer NOT NULL,
    write_date timestamp without time zone,
    create_date timestamp without time zone
);

CREATE TABLE public.woo_tags_ept (
    id integer NOT NULL,
    woo_instance_id integer NOT NULL,
    create_uid integer,
    description text,
    exported_in_woo boolean,
    woo_tag_id integer,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    write_uid integer,
    slug character varying,
    name character varying NOT NULL
);

CREATE TABLE public.woo_template_categ_exclude_categ_rel (
    excluded_product_category_ids integer NOT NULL,
    woo_categ_id integer NOT NULL
);

CREATE TABLE public.woo_template_categ_incateg_rel (
    product_category_ids integer NOT NULL,
    woo_categ_id integer NOT NULL
);

CREATE TABLE public.woo_template_categ_rel (
    woo_template_id integer NOT NULL,
    woo_categ_id integer NOT NULL
);

CREATE TABLE public.woo_template_tags_rel (
    woo_template_id integer NOT NULL,
    woo_tag_id integer NOT NULL
);

CREATE TABLE public.woo_transaction_log (
    id integer NOT NULL,
    woo_instance_id integer,
    create_uid integer,
    create_date timestamp without time zone,
    mismatch_details boolean,
    write_uid integer,
    write_date timestamp without time zone,
    message text,
    type character varying
);