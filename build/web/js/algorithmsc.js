function getValue(id){
    return document.getElementById(id).value.trim();
}
var list_edge = new Array();
var list_node = new Array();
var ok = false;
function add_edge(e){
    event.preventDefault();
    
    var num_node = getValue('num_node');
    var num_edge = getValue('num_edge');
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if (num_node == '' || num_edge == '' || first_node == '' || last_node == ''){
        alert("Vui lòng nhập đầy đủ thông tin");
    }
    else if (first_node == last_node){
        alert("Hai đỉnh không được trùng nhau!");
    }
    else if(list_edge.length == num_edge) {
        alert("Đã đạt giới hạn cạnh!");
    }
    else if(((!list_node.includes(first_node) || !list_node.includes(last_node)) && list_node.length == num_node) ||
            ((!list_node.includes(first_node) && !list_node.includes(last_node)) && list_node.length == num_node-1)){
            alert("Đã đạt giới hạn đỉnh!");
    }
    else {
        if(!list_node.includes(first_node)){
            list_node.push(first_node);
        }
        if(!list_node.includes(last_node)){
            list_node.push(last_node);
        }
        if (list_edge.includes(edge) || list_edge.includes(edge_reserve)){
            alert("Cạnh đã tồn tại!");
        }
        else{
            list_size = list_edge.push(edge);
            document.getElementById("list_edge").innerHTML = list_edge.join(", ");
            document.getElementById("list_input_edge").value = list_edge.join("");
            document.getElementById("list_split_edge").value = list_edge.join(" ");
            drawGraph(list_edge.join(" "));
            ok = true;
        }
    }
}
function delete_edge(e){
    event.preventDefault();
    
    var first_node = getValue('first_node');
    var last_node = getValue('last_node');
    var edge = first_node + last_node;
    var edge_reserve = last_node + first_node;
    
    if(list_edge == 0){
        alert("Không có cạnh nào để xoá");
    }
    else if (first_node == '' || last_node == ''){
        alert("Vui lòng nhập cả hai đỉnh!");
    }
    else if (first_node == last_node){
        alert("Hai đỉnh không được trùng nhau!");
    }
    else if (!list_edge.includes(edge) && !list_edge.includes(edge_reserve)){
        alert("Cạnh không tồn tại!");
    }
    else{
        list_edge.splice(list_edge.indexOf(edge), 1);
        document.getElementById("list_edge").innerHTML = list_edge.join(", ");
        drawGraph(list_edge.join(" "));
    }
}
function displayResult(listEdge) {

    if(listEdge.trim().length > 4) drawGraph(listEdge);
    
    
//    let list_edges = listEdge.split(" ");
//    let edges = [];
//    let vertices = new Map();
//
//    for (let i = 0; i < list_edges.length; i++) {
//        let edge = list_edges[i];
//        let source = edge.charAt(0);
//        let target = edge.charAt(1);
//
//        if (!vertices.has(source)) {
//          vertices.set(source, { id: source });
//        }
//        if (!vertices.has(target)) {
//          vertices.set(target, { id: target });
//        }
//
//        edges.push({ source: source, target: target });
//    }
//
//    const svg = d3.select('#mySvg');
//    const width = parseInt(svg.style('width'), 10);
//    const height = parseInt(svg.style('height'), 10);
//
//    const simulation = d3.forceSimulation(Array.from(vertices.values()))
//    .force('link', d3.forceLink(edges).id(d => d.id))
//    .force('charge', d3.forceManyBody().strength(-800))
//    .force('center', d3.forceCenter(width / 2, height / 2))
//    .force('collision', d3.forceCollide().radius(30));
//
//  //    const defs = svg.append('defs');
//  //
//  //    defs.append('marker')
//  //    .attr('id', 'arrow')
//  //    .attr('viewBox', '0 -5 10 10')
//  //    .attr('refX', 10)
//  //    .attr('refY', 0)
//  //    .attr('markerWidth', 4)
//  //    .attr('markerHeight', 4)
//  //    .attr('orient', 'auto')
//  //    .append('path')
//  //    .attr('d', 'M0,-5L10,0L0,5')
//  //    .attr('fill', '#999');
//  //
//  //    const tooltip = d3.select('body').append('div')
//  //      .attr('class', 'tooltip')
//  //      .style('opacity', 0);
//
//    const link = svg.append('g')
//    .attr('stroke', '#999')
//    .attr('stroke-opacity', 0.6)
//    .selectAll('line')
//    .data(edges)
//    .join('line')
//    .attr('stroke-width', 2);
//  //  .attr('marker-end', 'url(#arrow)')
//  //  .attr('x1', d => vertices.get(d.source).x)
//  //  .attr('y1', d => vertices.get(d.source).y)
//  //  .attr('x2', d => vertices.get(d.target).x)
//  //  .attr('y2', d => vertices.get(d.target).y);
//
//    const node = svg.append('g')
//    .attr('stroke', '#fff')
//    .attr('stroke-width', 1.5)
//    .selectAll('circle')
//    .data(Array.from(vertices.values()))
//    .join('circle')
//    .attr('r', 22)
//    .attr('fill', '#69b3a2')
//    .on('mouseover', function (event, d) {
//        d3.select(this).attr('r', 26);
//        tooltip.text(d.id)
//        .style('left', (event.pageX + 10) + 'px')
//        .style('top', (event.pageY - 25) + 'px')
//        .style('opacity', 1);
//    })
//    .on('mouseout', function (event, d) {
//        d3.select(this).attr('r', 22);
//        tooltip.style('opacity', 0);
//    })
//    .call(drag(simulation));
//
//    const label = svg.append('g')
//      .attr('font-family', 'sans-serif')
//      .attr('font-size', 18)
//      .selectAll('text')
//      .data(Array.from(vertices.values()))
//      .join('text')
//      .text(d => d.id)
//      .attr('dx', -5)
//      .attr('dy', +5);
//
//    simulation.on('tick', () => {
//        link
//          .attr('x1', d => d.source.x)
//          .attr('y1', d => d.source.y)
//          .attr('x2', d => d.target.x)
//          .attr('y2', d => d.target.y);
//
//        node
//          .attr('cx', d => d.x)
//          .attr('cy', d => d.y);
//
//        label
//          .attr('x', d => d.x)
//          .attr('y', d => d.y);
//    });
//
//    function drag(simulation) {
//        function dragstarted(event, d) {
//            if (!event.active) simulation.alphaTarget(0.3).restart();
//            d.fx = d.x;
//            d.fy = d.y;
//        }
//
//        function dragged(event, d) {
//            d.fx = event.x;
//            d.fy = event.y;
//        }
//
//        function dragended(event, d) {
//            if (!event.active) simulation.alphaTarget(0);
//            d.fx = null;
//            d.fy = null;
//        }
//
//        return d3.drag()
//          .on('start', dragstarted)
//          .on('drag', dragged)
//          .on('end', dragended);
//    }
}
function drawGraph(listEdge) {
    
    document.getElementById('mySvg').innerHTML = '';
    
    
    let list_edges = listEdge.split(" ");
    let edges = [];
    let vertices = new Map();

    for (let i = 0; i < list_edges.length; i++) {
        let edge = list_edges[i];
        let source = edge.charAt(0);
        let target = edge.charAt(1);

        if (!vertices.has(source)) {
          vertices.set(source, { id: source });
        }
        if (!vertices.has(target)) {
          vertices.set(target, { id: target });
        }

        edges.push({ source: source, target: target });
    }

    const svg = d3.select('#mySvg');
    const width = parseInt(svg.style('width'), 10);
    const height = parseInt(svg.style('height'), 10);
    

    const simulation = d3.forceSimulation(Array.from(vertices.values()))
    .force('link', d3.forceLink(edges).id(d => d.id).distance(100).strength(1))
    .force('charge', d3.forceManyBody().strength(10))
    .force('center', d3.forceCenter(width / 2, height / 2))
    .force('collision', d3.forceCollide().radius(50));

    const link = svg.append('g')
    .attr('stroke', '#999')
    .attr('stroke-opacity', 0.6)
    .selectAll('line')
    .data(edges)
    .join('line')
    .attr('stroke-width', 2);

    const node = svg.append('g')
    .attr('stroke', '#000')
    .attr('stroke-width', 1.5)
    .selectAll('circle')
    .data(Array.from(vertices.values()))
    .join('circle')
    .attr('r', 22)
    .attr('fill', '#fff') // #69b3a2
    .on('mouseover', function (event, d) {
        d3.select(this).attr('r', 26);
        tooltip.text(d.id)
        .style('left', (event.pageX + 10) + 'px')
        .style('top', (event.pageY - 25) + 'px')
        .style('opacity', 1);
    })
    .on('mouseout', function (event, d) {
        d3.select(this).attr('r', 22);
        tooltip.style('opacity', 0);
    })
    .call(drag(simulation));

    const label = svg.append('g')
      .attr('font-family', 'Helvetica, Arial, Tahoma, sans-serif')
      .attr('font-size', 20)
      .attr('font-weight', 'bold')
      .selectAll('text')
      .data(Array.from(vertices.values()))
      .join('text')
      .text(d => d.id)
      .attr('dx', -5)
      .attr('dy', +5);

    simulation.on('tick', () => {
        link
          .attr('x1', d => d.source.x)
          .attr('y1', d => d.source.y)
          .attr('x2', d => d.target.x)
          .attr('y2', d => d.target.y);

        node
          .attr('cx', d => d.x)
          .attr('cy', d => d.y);

        label
          .attr('x', d => d.x)
          .attr('y', d => d.y);
    });

    function drag(simulation) {
        let selected = null;
        let initialPositions = new Map();

        function dragstarted(event, d) {
            if (!event.active) simulation.alphaTarget(0.3).restart();
            selected = d.id;
            d.fx = d.x;
            d.fy = d.y;
            vertices.forEach(function (value, key) {
                initialPositions.set(key, { x: value.x, y: value.y });
            });
        }

        function dragged(event, d) {
            if (selected !== d.id) return;
            d.fx = event.x;
            d.fy = event.y;
            vertices.forEach(function (value, key) {
                if (key !== d.id) {
                    value.x = initialPositions.get(key).x;
                    value.y = initialPositions.get(key).y;
                }
            });
        }

        function dragended(event, d) {
            if (!event.active) simulation.alphaTarget(0);
            selected = null;
            vertices.forEach(function (value, key) {
                if (value.x === null && value.y === null) {
                    value.x = Math.random() * 800;
                    value.y = Math.random() * 800;
                }
            });
        }

        return d3.drag()
            .on('start', dragstarted)
            .on('drag', dragged)
            .on('end', dragended);
    }
}