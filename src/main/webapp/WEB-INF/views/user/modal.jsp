<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- The Modal -->
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4>공지사항 작성</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="/kmove/board" method="get">
				<input type="hidden" name="action" value="create" />
				<div class="modal-body">
					<table class="table">
						<tr>
							<td>공지 제목</td>
							<td><input class="form-control" name="title" type="text"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea class="form-control" name="contents" rows="10"></textarea></td>
						</tr>					
					</table>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>