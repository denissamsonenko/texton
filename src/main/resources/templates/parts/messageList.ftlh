<div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</div>