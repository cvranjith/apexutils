create or replace function fn_ossa_pm_html
(
    p_pm in varchar2
)
return clob
is
l_html clob;
l_trcl varchar2(10) := 'ev';
procedure p(h varchar2) is begin l_html := l_html||h; end;

procedure td(x varchar2)
is
begin
p('<td class="'
  || case x when 'COMPLIANT' then 'thgr' when 'N/A' then 'tham' when 'AT_RISK' then 'thrd' end
  ||'">'||x||'</td>');
end;

begin

p ('<html>
      <style type="text/css">
      body{font-family: arial, serif;font-size:14px;}
      table{font-family: arial, serif;font-size:14px; text-align: left;}
	  table.bdr1 td{border-color: #D3D3D3;border-style: solid;border-width: 5px 5px 5px 5px;border-spacing: 0;border-collapse: collapse;padding: 4px;}
      table.bdr td{border-color: black;border-style: solid;font-family: arial, serif;font-size:14px;border-width: 1px 1px 1px 1px;border-spacing: 0;border-collapse: collapse;padding: 4px;}
      table.bdr th{border-color: black;border-style: solid;font-family: arial, serif;font-size:14px;border-width: 1px 1px 1px 1px;border-spacing: 0;border-collapse: collapse;padding: 4px;}
      table.bdr {border-width: 0 0 1px 1px;border-spacing: 0;border-collapse: collapse;padding: 4px;}
      th {background: #D3D3D3}
      .od { background: #F5B7B1}
      .ev { background: #FADBD8}
      .tdrd { color: red; font-weight: bold; }
      .tdgr { color: green; font-weight: bold; }
      .tdam { color: #DC7633; font-weight: bold; }
      .thrd { color: white; background-color: red; font-weight: bold; }
      .thgr { color: white; background-color: green; font-weight: bold; }
      .tham { color: white; background-color: #DC7633; font-weight: bold; }
	  .tdgray {background: #D3D3D3}
      a:link {color: #FF0000;}
      </style>
<table  align="left" width="80%" class="bdr1"><tr><td>

<div>
<br>
<br>
</div>
<br>
      Hi <b>'||p_pm||'</b>
      <br><br>
<br><br>
As per <a href="https://ocp.oraclecorp.com/ords/gc3pdb001/f?p=102:1:640657796355:::::"> OSSA Compliance Portal (OCP) </a>, you are PM for below PA#(s). <br>
You are required to get the pending attestations completed at the earliest. Please work with the respective CSS(s) and complete the pending attestations ASAP<br>
<br><br><table class="bdr" align="center" width="80%">
<tr>
      <th>PA #</th>
      <th>Customer</th>
      <th>Project Title</th>
      <th>OSSA Status</th>
      <th>Attestatin Status</th>
      <th>CSS ASSIGNED</th>
      <th>CSL</th>
      <th>CSS</th>
      <th>SECURITY EDUCATION</th>
      <th>MALWARE PREVENTION</th>
      <th>THIRD PARTY DEPENDENCIES</th>
      <th>SECURE DESIGN</th>
      <th>SECURE CONFIGURATION</th>
      <th>SECURE CODING STANDARDS</th>
      <th>STATIC SOURCE CODE ANALYSIS</th>
      <th>SECURITY TESTING</th>
      </tr>');
for i in 
(
select distinct PA_NUMBER,CUSTOMER_NAME,PROJECT_TITLE,OSSA_STATUS,ATTESTATION_STATUS,CSS_ASSIGNED,CSL,
CSS,SECURITY_EDUCATION,
MALWARE_PREVENTION,
THIRD_PARTY_DEPENDENCIES,
SECURE_DESIGN,
SECURE_CONFIGURATION,
SECURE_CODING_STANDARDS,
STATIC_SOURCE_CODE_ANALYSIS,
SECURITY_TESTING
from vw_ossa_css
    where project_manager = p_pm
order by pa_number
)
loop
l_trcl := case when l_trcl = 'ev' then 'od' else 'ev' end;
p('<tr class="'||l_trcl||'">');
    p('<td>'||i.PA_NUMBER||'</td>');
    p('<td>'||i.CUSTOMER_NAME||'</td>');
    p('<td>'||i.PROJECT_TITLE||'</td>');
    p('<td>'||i.OSSA_STATUS||'</td>');
    p('<td>'||i.ATTESTATION_STATUS||'</td>');
    p('<td>'||i.CSS_ASSIGNED||'</td>');
    td(i.CSL);
    td(i.CSS);
    td(i.SECURITY_EDUCATION);
    td(i.MALWARE_PREVENTION);
    td(i.THIRD_PARTY_DEPENDENCIES);
    td(i.SECURE_DESIGN);
    td(i.SECURE_CONFIGURATION);
    td(i.SECURE_CODING_STANDARDS);
    td(i.STATIC_SOURCE_CODE_ANALYSIS);
    td(i.SECURITY_TESTING);
    
p('</tr>');
end loop;

p('
</table><br><br>
</td></tr> <tr><td class="tdgray">
<b>Useful Information / Links </b>
<li>	<a href="https://ocp.oraclecorp.com/ords/gc3pdb001/f?p=102:1:640657796355:::::"> OSSA Compliance Portal </a> 
</li><li> <a href="https://confluence.oraclecorp.com/confluence/display/FSGBUCT/FSGBU+Banking+Consulting+Security"> FSGBU Banking Consulting Security </a> 
</li><li> <a href="https://confluence.oraclecorp.com/confluence/display/NASCIS/OSSA+Rollout+FAQs"> OSSA Rollout FAQs </a>
</li><li> <a href="https://confluence.oraclecorp.com/confluence/pages/viewpage.action?pageId=1128061716"> OSSA for CSS/CSL community</a></li>
  For OCP support, join the #help-consulting-ossa-ocp slack channel!
<br><br><br>
		</td></tr></table>
        <div>
  <br> PS: Please do not reply to this mail. Contact your CSL for clarifications. <br><br><br>
  
        Cheers...Ranjith
        <br>
        <br>Ranjith Vijayan | <a href="mailto:ranjith.vijayan@oracle.com">ranjith.vijayan@oracle.com</a>
<br>Solution Architect
<br>Office: +65.64362739
<br>Mobile: +65.92356171
<br>Banking Consulting, Japan and Asia Pacific
<br>Oracle Financial Services Software Pte Ltd, Singapore
        </div>
        </html>');
return l_html;
end;
