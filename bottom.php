			</div>
			<!--
      <footer>
      </footer>
			-->


    </div>    <!-- /.container -->


    <!-- Load JS here for greater good =============================-->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.ui.touch-punch.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/bootstrap-switch.js"></script>
    <script src="js/flatui-checkbox.js"></script>
    <script src="js/flatui-radio.js"></script>
    <script src="js/jquery.placeholder.js"></script>
    <script src="js/bootswatch.js"></script>
		<script src="js/jquery.newsTicker.js"></script>
		
		<script type="text/javascript" src="js/jscolor/jscolor.js"></script>
		<script type="text/javascript">
				$(".escalado").mouseleave(function(e) {
          var l = $(".escalado.checked").size();
					if (l > 0) {
						$(".desescalar").removeAttr("disabled");
					} else {
						$(".desescalar").attr("disabled", "disabled");
					}
				});

				/* Ticker */
				var nt_title = $('.ticker').newsTicker({
					row_height: 167,
					max_rows: 1,
					duration: 3000,
					pauseOnHover: 0
				});
						
				var nt_title = $('.upcomming-ticker').newsTicker({
					row_height: 50,
					max_rows: 1,
					duration: 3000,
					pauseOnHover: 0
				});
						

			/* Clock */
			function updateClock() {
				var currentTime = new Date ( );
				var currentHours = currentTime.getHours ( );
				var currentMinutes = currentTime.getMinutes ( );
				var currentSeconds = currentTime.getSeconds ( );
		 
				// Pad the minutes and seconds with leading zeros, if required
				currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
				currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;
		 
				// Choose either "AM" or "PM" as appropriate
				var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";
		 
				// Convert the hours component to 12-hour format if needed
				//currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;
		 
				// Convert an hours component of "0" to "12"
				currentHours = ( currentHours == 0 ) ? 12 : currentHours;
		 
				// Compose the string for display
				var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds; // + " " + timeOfDay;
				 
				$("#clock").html(currentTimeString);
		  }
			 
			$(document).ready(function() {
				 setInterval('updateClock()', 1000);
			});			
			/**/
			
			
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