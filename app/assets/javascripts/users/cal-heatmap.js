$(window).on('load',function(){
  if($('#activity-heatmap')[0]){
    var cal = new CalHeatMap();
    cal.init({
      itemSelector: '#activity-heatmap',
      domain: 'month',
      subDomain: 'day',
      range: 3,
      data: '/test.json',
      dataType: 'json',
      highLight: 'now',
    });
  }
});
