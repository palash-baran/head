[#ftl]
[#import "spring.ftl" as spring]
[#import "blueprintmacros.ftl" as mifos]

[@mifos.header "title" /]
[@mifos.topNavigationNoSecurity currentTab="Admin" /]
<div class="sidebar ht600">
[#include "adminLeftPane.ftl" ]
</div> 
<!--  Main Content Begins-->  
  <div class=" content leftMargin180">
 <div class="bluedivs paddingLeft"><a href="admin.ftl">[@spring.message "admin"/]</a>&nbsp;/&nbsp;<span class="fontBold">[@spring.message "viewEditChecklists"/]</span></div>
       <p>&nbsp;&nbsp;</p>
  	<form method="" action="" name="formname">
    <div class="span-24">
  		
    	<div class="span-24 ">
        	<div class="span-15 ">
            	<div><span class="orangeheading">[@spring.message "checklistName" /]</span></div>
                <div><span><img src="pages/framework/images/status_activegreen.gif" /></span>&nbsp;<span>[@spring.message "active" /]</span></div><br />
                <div><span>[@spring.message "type" /]</span>&nbsp;<span>&nbsp;</span></div>
                <div><span>[@spring.message "status" /]</span>&nbsp;<span>&nbsp;</span></div>
                <div><span>[@spring.message "createdby" /]</span>&nbsp;<span>&nbsp;</span></div>
                <div><span>[@spring.message "createddate" /]</span>&nbsp;<span>&nbsp;</span></div>
        	</div>
            <span class="span-4 rightAlign"><a href="editChecklist.html">[@spring.message "editChecklistInformation" /]</a></span>
        </div>
        <div class="clear">&nbsp;</div>
        <p class="span-24 ">
			<span class="fontBold">[@spring.message "items" /]</span><br />
            <ul style="list-style:none">
            	<li>[@spring.message "item1" /]</li>
                <li>[@spring.message "item2" /]</li>
            </ul>
        </p>
	</div>
   	</form> 
  </div><!--Main Content Ends-->
   [@mifos.footer/]