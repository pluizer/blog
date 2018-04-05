#!/bin/bash

# all articles by creation time
articles=`ls -tU articles/*.md`

# return the title an article
function title() {
    head -n 1 $1 | cut -c 3-
}

# place to header of the page
cat pre.html

# place links to articles
echo "<nav><ul>"
for filename in $articles; do
    title=`title $filename`
    echo "  <li><a href=\"#${title// /-}\">$title</a></li>"
done;
echo "</ul></nav>"

# place holder for tags

# place articles
echo "<section>"
for filename in $articles; do
    title=`title $filename`
    echo "<article id=\"${title// /-}\">"
    markdown $filename
    echo "</article>"
done;
echo "</section>"

echo '<div style="clear: both;"></div>'
echo '<a id="rvr_totop" href="#top">to top</a>'

# place the footer of the page
cat post.html
