(function ($) {
	'use strict';

	$(function () {
		var $form = $( 'form[action="options.php"]' );
		if ( ! $form.length || ! window.designExperimentsAdmin ) {
			return;
		}

		$form.on( 'change', 'input[name="design-experiments-setting"]', function () {
			var experiment = $( this ).val();

			$.post(
				designExperimentsAdmin.ajaxUrl,
				{
					action: 'design_experiments_preview',
					nonce: designExperimentsAdmin.nonce,
					experiment: experiment
				}
			).always( function () {
				window.location.reload();
			} );
		} );
	});
})(jQuery);
