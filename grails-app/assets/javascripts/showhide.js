$('#hide').click(function()
{
	$('#content').hide('blind');
	$('#hide').hide();
	$('#show').show();
});

$('#show').click(function()
{
	$('#content').show('blind');
	$('#hide').hide();
	$('#hide').show();
});

