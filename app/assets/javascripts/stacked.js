//set up container for stacked graph

var container1 = d3.select("#stacked")
margin_stacked = {top: 20, right: 180, bottom: 30, left: 40},
width_stacked = +container1.attr("width") - margin_stacked.left - margin_stacked.right,
height_stacked = +container1.attr("height") - margin_stacked.top - margin_stacked.bottom,
stacked_path = container1.append("g").attr("transform", "translate(" + margin_stacked.left + "," + margin_stacked.top + ")");


//set up x and y variables for stacked graph

var x_stacked = d3.scaleBand()
.rangeRound([0, width])
.padding(0.3)
.align(0.3);

var y_stacked = d3.scaleLinear()
.rangeRound([height, 0]);

var z_stacked = d3.scaleOrdinal(d3.schemeCategory20);
// .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);


//

var stack = d3.stack();

d3.csv("/stacked.csv", type, function(error, data) {
       if (error) throw error;
       
       data.sort(function(a, b) { return b.total - a.total; });
       
       x_stacked.domain(data.map(function(d) { return d.Author; }));
       y_stacked.domain([0, d3.max(data, function(d) { return d.total; })]).nice();
       z_.domain(data.columns.slice(1));
       
       stacked_path.selectAll(".serie")
       .data(stack.keys(data.columns.slice(1))(data))
       .enter().append("g")
       .attr("class", "serie")
       .attr("fill", function(d) { return z_stacked(d.key); })
       .selectAll("rect")
       .data(function(d) { return d; })
       .enter().append("rect")
       .attr("x", function(d) { return x_stacked(d.data.Author); })
       .attr("y", function(d) { return y_stacked(d[1]); })
       .attr("height", function(d) { return y_stacked(d[0]) - y_stacked(d[1]); })
       .attr("width", x_stacked.bandwidth());
       
       stacked_path.append("g")
       .attr("class", "axis axis--x")
       .attr("transform", "translate(0," + height_stacked + ")")
       .call(d3.axisBottom(x_stacked));
       
       stacked_path.append("g")
       .attr("class", "axis axis--y")
       .call(d3.axisLeft(y_stacked).ticks(10, "s"))
       .append("text")
       .attr("x", 2)
       .attr("y", y_stacked(y_stacked.ticks(10).pop()))
       .attr("dy", "0.35em")
       .attr("text-anchor", "start")
       .attr("fill", "#000")
       
       
       var legend = stacked_path.selectAll(".legend")
       .data(data.columns.slice(1).reverse())
       .enter().append("g")
       .attr("class", "legend")
       .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; })
       .style("font", "12px sans-serif");
       
       legend.append("rect")
       .attr("x", width_stacked + 18)
       .attr("width", 18)
       .attr("height", 18)
       .attr("fill", z_stacked);
       
       legend.append("text")
       .attr("x", width_stacked + 44)
       .attr("y", 9)
       .attr("dy", ".35em")
       .attr("text-anchor", "start")
       .text(function(d) { return d; });
       });

function type(d, i, columns) {
    for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
    d.total = t;
    return d;
}
