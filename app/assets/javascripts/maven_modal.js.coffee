$.rails.allowAction = (link) ->
	return true unless link.attr('data-confirm')
	$.rails.showConfirmDialog(link) # look bellow for implementations
	false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
	link.removeAttr('data-confirm')
	link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
	message = link.attr 'data-confirm'
	html = """
			<div class="modal" id="confirmationDialog">
				<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<a class="close" data-dismiss="modal">×</a>
					<h3>#{message}</h3>
				</div>
				<div class="modal-body">
					<p>This action cannot be reversed</p>
				</div>
				<div class="modal-footer">
					<a data-dismiss="modal" class="btn btn-danger btn-block confirm">Delete</a>
					<a data-dismiss="modal" class="btn btn-default btn-block">Cancel</a>
				</div>
				</div>
				</div>
			</div>
         """
	$(html).modal()
	$('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
