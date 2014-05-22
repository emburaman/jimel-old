		</div>
    <!-- /.container -->


    <!-- Load JS here for greater good =============================-->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.ui.touch-punch.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/bootstrap-switch.js"></script>
    <script src="js/flatui-checkbox.js"></script>
    <script src="js/flatui-radio.js"></script>
    <script src="js/jquery.tagsinput.js"></script>
    <script src="js/jquery.placeholder.js"></script>

		<script type="text/javascript" src="js/farbtastic.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".escalado").mouseleave(function(e) {
					var l = $(".escalado.checked").size();
					if (l > 0) {
						$(".desescalar").removeAttr("disabled");
					} else {
						$(".desescalar").attr("disabled", "disabled");
					}
				});
				
				$('#color').focusin(function(e) {
					$('#colorpicker').css('display', 'block');
				});
				$('#color').focusout(function(e) {
					$('#colorpicker').css('display', 'none');
				});
		
				$('#colorpicker').farbtastic('#color');
				
				$().click(function(e) {
					alert();
				});
			});
		</script>
  </body>
</html>