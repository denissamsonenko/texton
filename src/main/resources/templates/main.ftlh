<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input class="form-control" type="text" name="filter" value="${filter?if_exists}"
                       placeholder="Find by tag" />
                <button class="btn btn-primary mb-2" type="submit">Find</button>
            </form>
        </div>
    </div>

<#include "parts/messageEdit.ftlh" />
<#include "parts/messageList.ftlh" />
</@c.page>