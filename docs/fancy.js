function find_all_tags() {

    function sort_tags(tags) {
	return Object.keys(tags).sort(function(a, b) {
	    return tags[a] - tags[b];
	}).reverse();
    }

    var tags = {};
    var articles = document.getElementsByTagName('article')
    for (var i=0; i<articles.length; i++) {
	var uls = articles[i].getElementsByTagName('ul');
	// last ul elemets holds the tags ...
	var tag_ul = uls[uls.length-1];
	var tag_lis = tag_ul.getElementsByTagName('li');
	for (var j=0; j<tag_lis.length; j++) {
	    var tag = tag_lis[j].innerText;
	    tags[tag] = tags[tag] ? tags[tag]+1 : 1;
	}
    }
    return sort_tags(tags);
}

function create_tags_element(tags) {

    function create_tag_button(name) {
	var item = document.createElement('li');
	item.appendChild(document.createTextNode(name));
	return item;
    }

    var ul = document.createElement('ul');
    tags.forEach(function(name) {
	ul.appendChild(create_tag_button(name));
    });
    return ul;
}

window.addEventListener('load', function() {
    var tags = find_all_tags();
    var tags_element = create_tags_element(tags);

    document.getElementsByTagName('header')[0].appendChild(tags_element);

    console.log(tags_element);
});
