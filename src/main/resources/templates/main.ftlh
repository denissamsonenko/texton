<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input class="form-control" type="text" name="filter" value="${filter?if_exists}"
                       placeholder="Find by tag">
                <button class="btn btn-primary mb-2" type="submit">Find</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group">
            <form method="post" enctype="multipart/form-data">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                        value="<#if message??>${message.text}</#if>" name="text" placeholder="Input text" />
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
                <input class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="tag" />
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
                <div class="custom-file">
                    <input type="file" name="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Add</button>
            </form>
        </div>
    </div>

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
</@c.page>