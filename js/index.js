$(document).ready(function () {

	/*	Disables mobile keyboard from displaying when clicking +/- inputs */

	$('.input-number-decrement').attr('readonly', 'readonly');
	$('.input-number-increment').attr('readonly', 'readonly');

	/*Attributes variables with min and max values for counter*/

	var min = $(".input-number-decrement").data("min");
	var max = $(".input-number-increment").data("max");

	/*Incrementally increases the value of the counter up to max value, and ensures +/- input works when input has no value (i.e. when the input-number field has been cleared) */

	$(".input-number-increment").on('click', function () {
		var $incdec = $(this).prev();

		if ($incdec.val() == '') {
			$incdec.val(0);
		} else if ($incdec.val() < max) {
			$incdec.val(parseInt($incdec.val()) + 1);
		}
	});

	/*Incrementally decreases the value of the counter down to min value, and ensures +/- input works when input has no value (i.e. when the input-number field has been cleared) */

	$(".input-number-decrement").on('click', function () {
		var $incdec = $(this).next();

		if ($incdec.val() == '') {
			$incdec.val(0);
		} else if ($incdec.val() > min) {
			$incdec.val(parseInt($incdec.val()) - 1);
		}
	});

	/* Removes any character other than a number that is entered in number input */

	var input = document.getElementsByClassName('input-number');

	$(input).on('keyup input', function () {

		this.value = this.value.replace(/[^0-9]/g, '');

		/* Gives an error if number entered is over max */

		if (this.value > max) {
			this.value = max;
			error();
		}
		if(this.value < min){
			this.value = min;
			error();
		}
	});

	/* Function to display error for numbers over max */

	function error() {
		$('.data').empty();
		$('.data').append('<p class="error">You can only order between ' + min + ' and ' + max + ' items!</p>');
		$(".data").fadeIn(400);

		/* Fades out error once the counter is clicked on */

		$(".counter").on('click', function () {
			$(".error").fadeOut(800);
		});
	}

});

/*
function submitbutton() {
	var standard = $('#standard').val();
alert(standard);
}*/
