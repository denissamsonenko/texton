<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />
<div class="row row-cols-1 row-cols-md-2 g-4 mt-3" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</div>
<@p.pager url page />