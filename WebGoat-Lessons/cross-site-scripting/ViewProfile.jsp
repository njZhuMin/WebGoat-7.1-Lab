<!--
STAGE 4 FIXES Look for the <-- STAGE 4 - FIX
-->
<%@ page contentType="text/html; charset=ISO-8859-1" language="java"
		 import="org.owasp.webgoat.plugin.GoatHillsFinancial.Employee, org.owasp.webgoat.plugin.crosssitescripting.CrossSiteScripting" errorPage="" %>
<%@ page import="org.owasp.webgoat.session.WebSession" %>
<%
WebSession webSession = ((WebSession)session.getAttribute("websession"));
	Employee employee = (Employee) session.getAttribute("CrossSiteScripting." + CrossSiteScripting.EMPLOYEE_ATTRIBUTE_KEY);
	CrossSiteScripting lesson = (CrossSiteScripting) webSession.getCurrentLesson();
//	int myUserId = getIntSessionAttribute(webSession, "CrossSiteScripting." + CrossSiteScripting.USER_ID);
%>
		<div class="lesson_title_box"><strong>Welcome Back </strong><span class="lesson_text_db"><%=webSession.getUserNameInLesson()%></span></div>
		<div class="lesson_text">
				<Table>
				<TR><TD>
						First Name:
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getFirstName())%>
					</TD>
					<TD>				
						Last Name:
					</TD>
					<TD>
					 	<%=lesson.htmlEncode(webSession, employee.getLastName())%>
					</TD>
				</TR>
				<TR><TD>				
						Street: 
					</TD>
					<TD>
						<!-- STAGE 4 - FIX  Note that the description value below gets encoded and address1 here is not -->

						<%=lesson.htmlEncode(webSession, employee.getAddress1())%>
					</TD>
					<TD>				
						City/State: 
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getAddress2())%>
					</TD>
				</TR>
				<TR><TD>
						Phone: 
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getPhoneNumber())%>
					</TD>
					<TD>				
						Start Date: 
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getStartDate())%>
					</TD>
				</TR>
				<TR><TD>
			    		SSN: 
			    	</TD>
			    	<TD>
			    		<%=lesson.htmlEncode(webSession, employee.getSsn())%>
					</TD>
					<TD>				
						Salary: 
					</TD>
					<TD>
						<%=employee.getSalary()%>
					</TD>
				</TR>
				<TR><TD>
						Credit Card: 
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getCcn())%>
					</TD>
					<TD>				
						Credit Card Limit: 
					</TD>
					<TD>
						<%=employee.getCcnLimit()%>
					</TD>
				</TR>
				<TR><TD>
						Comments: 
					</TD>
					<TD>
						<!-- Encode data that might contain HTML content to protect against XSS -->

						<%=lesson.htmlEncode(webSession, employee.getPersonalDescription())%>
					</TD>
					<TD>				
						Manager: 
					</TD>
					<TD>
						<%=employee.getManager()%>
					</TD>	
				</TR>
				<TR><TD>
						Disciplinary Explanation: 
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getDisciplinaryActionNotes())%>
					</TD>
					<TD>				
						Disciplinary Action Dates: 
					</TD>
					<TD>
						<%=lesson.htmlEncode(webSession, employee.getDisciplinaryActionDate())%>
					</TD>
				</TR>
				</Table>
		</div>
		<div class="lesson_buttons_bottom">
		    <table width="460" height="20" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                 	<td width="50">
					<%					
					if (webSession.isAuthorizedInLesson(webSession.getUserIdInLesson(), CrossSiteScripting.LISTSTAFF_ACTION))
					{
					%>
						<form method="POST" action="<%=webSession.getCurrentLesson().getFormAction()%>">
							<input type="hidden" name="<%=CrossSiteScripting.EMPLOYEE_ID%>" value="<%=employee.getId()%>">
							<input type="submit" name="action" value="<%=CrossSiteScripting.LISTSTAFF_ACTION%>"/>
						</form></td>
					<% 
					}
					%>			
		             <td width="50">
					<%					
					if (webSession.isAuthorizedInLesson(webSession.getUserIdInLesson(), CrossSiteScripting.EDITPROFILE_ACTION))
					{
					%>
						<form method="POST" action="<%=webSession.getCurrentLesson().getFormAction()%>">
							<input type="hidden" name="<%=CrossSiteScripting.EMPLOYEE_ID%>" value="<%=employee.getId()%>">
							<input type="submit" name="action" value="<%=CrossSiteScripting.EDITPROFILE_ACTION%>"/>
						</form>
					<% 
					}
					%>			
					</td>
                    <td width="60">
					<%
					if (webSession.isAuthorizedInLesson(webSession.getUserIdInLesson(), CrossSiteScripting.DELETEPROFILE_ACTION))
					{
					%>
						<form method="POST" action="<%=webSession.getCurrentLesson().getFormAction()%>">
							<input type="hidden" name="<%=CrossSiteScripting.EMPLOYEE_ID%>" value="<%=employee.getId()%>">
							<input type="submit" name="action" value="<%=CrossSiteScripting.DELETEPROFILE_ACTION%>"/>
						</form>
					<% 
					}
					%>
					</td>
                      <td width="190">&nbsp;</td>
                      <td width="76">
						<form method="POST" action="<%=webSession.getCurrentLesson().getFormAction()%>">
							<input type="submit" name="action" value="<%=CrossSiteScripting.LOGOUT_ACTION%>"/>
						</form>
					</td>
				</tr>
         	</table>
		</div>
