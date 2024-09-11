<div id="Content" class="searchResults">
    <h1>$Title</h1>

    <% if $Query %>
        <p class="searchQuery">
            <strong>
                <%t ElementalFluentSearch.searchedFor, "You searched for &quot;{query}&quot;" query=$Query %>
            </strong>
        </p>
    <% end_if %>

    <% if $Results %>
        <ul id="SearchResults">
            <% loop $Results %>
                <li>
                    <a class="searchResultHeader" href="$Link">
                        <% if $MenuTitle %>
                            $MenuTitle
                        <% else %>
                            $Title
                        <% end_if %>
                    </a>
                    <p>$Content.LimitWordCountXML</p>
                    <a
                        class="readMoreLink"
                        href="$Link"
                        title="<%t ElementalFluentSearch.readMoreTitle "Read more about {title}" title=$Title %>"
                    >
                        <%t ElementalFluentSearch.readMore "Read more about &quot;{title}&quot;" title=$Title %>
                    </a>
                </li>
            <% end_loop %>
        </ul>
    <% else %>
        <p>
            <%t ElementalFluentSearch.noResults "Sorry, your search query did not return any results." %>
        </p>
    <% end_if %>

    <% if $Results.MoreThanOnePage %>
        <div id="PageNumbers">
            <% if $Results.NotLastPage %>
                <a
                    class="next"
                    href="$Results.NextLink"
                    title="<%t ElementalFluentSearch.nextTitle "View the next page" %>"
                >
                    <%t ElementalFluentSearch.next "Next" %>
                </a>
            <% end_if %>
            <% if $Results.NotFirstPage %>
                <a
                    class="prev"
                    href="$Results.PrevLink"
                    title="<%t ElementalFluentSearch.previousTitle "View the previous page" %>"
                >
                    <%t ElementalFluentSearch.previous "previous" %>
                </a>
            <% end_if %>
            <span>
                <% loop $Results.Pages %>
                    <% if $CurrentBool %>
                        $PageNum
                    <% else %>
                        <a
                            href="$Link"
                            title="<%t ElementalFluentSearch.viewPageNumber "View page number" %> $PageNum"
                        >
                            $PageNum
                        </a>
                    <% end_if %>
                <% end_loop %>
            </span>
            <p>
                <%t ElementalFluentSearch.page "Page" %> $Results.CurrentPage
                <%t ElementalFluentSearch.of  "of" %> $Results.TotalPages
            </p>
        </div>
    <% end_if %>
</div>
