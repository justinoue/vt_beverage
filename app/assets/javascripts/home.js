var pusher = new Pusher('5449979569f81fa685c8');
var channel = pusher.subscribe('orders');

channel.bind('shipped', function(data){
  console.log('shipped: '+data.message);
  $('#shipped-count').html(data.message);
});

channel.bind('ordered', function(data){
  console.log('ordered: '+data.message);
  $('#ordered-count').html(data.message);
});

channel.bind('who', function(data){
  console.log(data);
  $('#who-ordered li').last().fadeOut(400, function(){
    $('#who-ordered').prepend(
      '<li class="list-group-item">'+data.first_name+' from '+data.city+', '+data.state+' just ordered '+data.quantity+'!</li>'
    );
    this.remove();
  });
});