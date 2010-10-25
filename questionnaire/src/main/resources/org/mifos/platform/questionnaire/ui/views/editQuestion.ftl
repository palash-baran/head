[#ftl]
[#--
* Copyright (c) 2005-2010 Grameen Foundation USA
*  All rights reserved.
*
*  Licensed under the Apache License, Version 2.0 (the "License");
*  you may not use this file except in compliance with the License.
*  You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS,
*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
*  implied. See the License for the specific language governing
*  permissions and limitations under the License.
*
*  See also http://www.apache.org/licenses/LICENSE-2.0.html for an
*  explanation of the license and how it is applied.
--]
[#include "layout.ftl"]
[@adminLeftPaneLayout]
    <STYLE TYPE="text/css"><!-- @import url(pages/questionnaire/css/questionnaire.css); --></STYLE>
    <script type="text/javascript" src="pages/js/jquery/jquery.keyfilter-1.7.js"></script>
    <script type="text/javascript" src="pages/framework/js/CommonUtilities.js"></script>
    <script src="pages/questionnaire/js/createQuestion.js" type="text/javascript"></script>
    <script src="pages/questionnaire/js/editQuestion.js" type="text/javascript"></script>
    <span id="page.id" title="editQuestion"></span>
    [#assign breadcrumb = {"admin":"AdminAction.do?method=load", "questionnaire.view.questions":"viewQuestions.ftl", "questionnaire.editquestion":""}/]
    [@mifos.crumbpairs breadcrumb/]
    <div class="content_panel">
        <h1>
            ${questionDefinition.currentQuestion.text} - [@spring.message "questionnaire.editquestion"/]
        </h1>
        <p class="red">
            [@spring.message "questionnaire.editquestion.warning"/]
        </p>
        <p>
            [@spring.message "questionnaire.editquestion.instructions"/]
        </p>
        <div id="allErrorsDiv" class="allErrorsDiv">
            [@mifosmacros.showAllErrors "questionDefinition.*"/]
        </div>
        <form name="editquestionform" action="viewAndEditQuestion.ftl?execution=${flowExecutionKey}" method="POST" focus="currentQuestion.text">


            [#include "questionDefinition.ftl"]
        <div class="button_footer">
            <div class="button_container">
                    <input type="submit" id="_eventId_update" name="_eventId_update" value="[@spring.message "questionnaire.submit"/]" class="buttn"/>
                    &nbsp;
                    <input type="submit" id="_eventId_cancel" name="_eventId_cancel" value="[@spring.message "questionnaire.cancel"/]" class="cancelbuttn"/>
            </div>
        </div>

        </form>
    </div>
[/@adminLeftPaneLayout]