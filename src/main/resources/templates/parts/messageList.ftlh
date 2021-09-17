<div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer">
                ${message.authorName}
            </div>
        </div>
    <#else>
        No messages
    </#list>
</div>