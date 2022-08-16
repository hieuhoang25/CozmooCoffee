let fillEdit = function(data) {
	// alert(data.UserId);

	let p = data.Password;
	let f =  document.querySelector('form[name = "edit-f"]');
	console.log(f);
	let pi = f.querySelector('input[name = "password"]');
	$("form[name='edit-f'] input[name='userId']").val(data.UserId);
	$("form[name='edit-f'] input[name='hoTen']").val(data.HoTen);
	$("form[name='edit-f'] input[name='email']").val(data.Email);
	$("form[name='edit-f'] input[name='phone']").val(data.Phone);
	$("form[name='edit-f'] input[name='diaChi']").val(data.DiaChi);
	
	// pi.value = p;
	$("form[name='edit-f'] input[name='password']").val(data.Password);
	$("form[name='edit-f'] input[name='c-password']").val(data.Password);
	f.querySelector('#r-admin').checked = data.Role;
	f.querySelector('#r-user').checked = !data.Role;
	console.log('passwrod : ' + p);
}
let edit = function(id) {
	// if(!$('#update').hasClass('show')) {
	$.ajax({
		type: 'GET',
		url: path + '/admin/users/find',
		dataType: 'json',
		contentType: 'application/js',
		data: { id: id },
		success: function(result) {
			console.log(result.UserId);
			fillEdit(result);
		}

	})
	//}     
}
