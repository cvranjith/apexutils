create or replace procedure pr_send_css_mail
(p_single_css varchar2, p_simulation in boolean := true)
is
procedure pr_send_mail
(
    p_css in varchar2
)
is
    l_body         clob;
    l_to varchar2(1000);
begin
    if p_simulation then l_to := 'ranjith.vijayan@oracle.com'; else l_to := p_css; end if;
    l_body := fn_ossa_html (p_css);
    APEX_MAIL.SEND(
        p_to        => l_to,
        p_from      => 'no-reply-ossa-compliance-fsgbu-japac@oracle.com',
        p_subj      => 'ACTION REQUIRED: OSSA Compliance',
        p_body      => l_body,
        p_body_html => l_body,
        p_replyto   => 'no-reply-ossa-compliance-fsgbu-japac@oracle.com'
        ); 
end;
begin
for i in (select distinct css_1 from vw_ossa_css where css_1 = nvl(p_single_css,css_1)
         and
          CSL||
CSS||SECURITY_EDUCATION||
MALWARE_PREVENTION||
THIRD_PARTY_DEPENDENCIES||
SECURE_DESIGN||
SECURE_CONFIGURATION||
SECURE_CODING_STANDARDS||
STATIC_SOURCE_CODE_ANALYSIS||
SECURITY_TESTING like '%AT_RISK%'
         )
loop
pr_send_mail(i.css_1);
end loop;
end;
/
