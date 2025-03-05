function selectSeller(id) {
	location.href = "/seller?id=" + id;
}

function goOrderList(sellerId) {
	console.log(sellerId)
	const url = "/orderList/" + sellerId + "/1"
	location.href = url
}