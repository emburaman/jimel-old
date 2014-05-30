			<!-- <div id="screen-size"></div> -->
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

      });
			
			/*
      $(window).resize(function() {
        var largura = $(document).width();
        var altura  = $(document).height();
        $('#screen-size').text(largura +'x'+ altura);
      });
			*/
		</script>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-19488461-6', 'jimel.com.br');
      ga('require', 'linkid', 'linkid.js');
      ga('send', 'pageview');
    </script>

  </body>
</html>