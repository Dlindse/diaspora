var svg = d3.select("#hbar"),
margin = {top: 20, right: 20, bottom: 30, left: 80},
width = +svg.attr("width") - margin.left - margin.right,
height = +svg.attr("height") - margin.top - margin.bottom;

var tooltip = d3.select("body").append("div").attr("class", "toolTip");

var x = d3.scaleLinear().range([0, width]);
var y = d3.scaleBand().range([height, 0]);

var g = svg.append("g")
.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.json("/ref_work", function(error, data) {
        if (error) throw error;
        
        data.sort(function(a, b) { return a.value - b.value; });
        
        x.domain([0, d3.max(data, function(d) { return d.value; })]);
        y.domain(data.map(function(d) { return d.name; })).padding(0.1);
        
        g.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x).ticks(5).tickFormat(function(d) { return parseInt(d); }).tickSizeInner([-height]));
        
        g.append("g")
        .attr("class", "y axis")
        .call(d3.axisLeft(y));
        
        g.selectAll(".bar")
        .data(data)
        .enter().append("rect")
        .attr("class", "bar")
        .attr("x", 0)
        .text(function(d) { return d.value; })
        .attr("height", y.bandwidth())
        .attr("y", function(d) { return y(d.name); })
        .attr("width", function(d) { return x(d.value); })
        .on("mousemove", function(d){
            tooltip
            .style("left", d3.event.pageX - 50 + "px")
            .style("top", d3.event.pageY - 70 + "px")
            .style("display", "inline-block")
            .html((d.name) + "<br>" + (d.author) + "<br>" + (d.value) + " references");
            })
        .on("mouseout", function(d){ tooltip.style("display", "none");});
        
        
        
        })





