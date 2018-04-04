#!/bin/bash

# all articles by creation time
articles=`ls -tU articles/*.md`

# return the title an article
function title() {
    head -n 1 $1 | cut -c 3-
}

# place to header of the page
cat pre.html

echo '<div id="wrapper">'

# place links to articles
echo "<nav><ul>"
for filename in $articles; do
    title=`title $filename`
    echo "  <li><a href=\"#${title// /-}\">$title</a></li>"
done;
echo "</ul></nav>"

# place articles
for filename in $articles; do
    title=`title $filename`
    echo "<a name=\"${title// /-}\"></a>"
    echo "<section><article>"
    markdown $filename
    echo "</article></section>"
done;

echo "</div>"

# place the footer of the page
cat post.html
