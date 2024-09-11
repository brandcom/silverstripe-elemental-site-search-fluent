<div id="Content" class="searchResults">
    <h1>$Title</h1>

    <% if $Query %>
        <p class="searchQuery">
            <strong>
                <%t ElementalFluentSearch.searchedFor, "You searched for &quot;{$Query}&quot;" Query=$Query%>
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
                        title="<%t ElementalFluentSearch.readMoreTitle "Read more about {$Title}" Title=$Title %>"
                    >
                        <%t ElementalFluentSearch.readMore "Read more about &quot;{$Title}&quot;" Title=$Title %>
                    </a>
                </li>
            <% end_loop %>
        </ul>
    <% else %>
        <p>
            <%t ElementalFluentSearch.noResults %>
        </p>
    <% end_if %>

    <% if $Results.MoreThanOnePage %>
        <div id="PageNumbers">
            <% if $Results.NotLastPage %>
                <a
                    class="next"
                    href="$Results.NextLink"
                    title="<%t ElementalFluentSearch.nextTitle %>"
                >
                    <%t ElementalFluentSearch.next %>
                </a>
            <% end_if %>
            <% if $Results.NotFirstPage %>
                <a
                    class="prev"
                    href="$Results.PrevLink"
                    title="<%t ElementalFluentSearch.previousTitle %>"
                >
                    <%t ElementalFluentSearch.previous %>
                </a>
            <% end_if %>
            <span>
                <% loop $Results.Pages %>
                    <% if $CurrentBool %>
                        $PageNum
                    <% else %>
                        <a
                            href="$Link"
                            title="<%t ElementalFluentSearch.viewPageNumber %> $PageNum"
                        >
                            $PageNum
                        </a>
                    <% end_if %>
                <% end_loop %>
            </span>
            <p>
                <%t ElementalFluentSearch.page %> $Results.CurrentPage
                <%t ElementalFluentSearch.of %> $Results.TotalPages
            </p>
        </div>
    <% end_if %>
</div>
