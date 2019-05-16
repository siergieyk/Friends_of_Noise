<?php require('includes/header.php'); ?> 
  
<div class="container">
	<div class="content">
		<h1>Admin Dashboard</h1><br />
		<hr>
	</div>

		<!--Picture with statistics-->
	<div class="left box">
		<img src="images/line_graph.gif" alt="lines" style="width:90%;">
	</div>
	<!--Field with one searchbar-->
	<div class="right box">
		<div class="submit">
			<strong>Search User: </strong><br/>
			Name: <input type="text" name="" class="" value="" />
			<input type="submit" value="Submit" />
		</div>
	</div>
	<!--Field with 2 search bars-->
	<div class="left box">
		<div class="submit">
			<strong>Search Events: </strong><br/>
			Name: <input type="text" name="" class="" value="" /> <br/>
			Description: <input type="text" name="" class="" value="" /> <br/>
			Image: (jpeg no larger than 50mb) <input type="text" name="" class="" value="" /> <br/>
			<input type="submit" value="Submit" />
		</div>
	</div>

	<!--Empty box-->
	<div class="right box">
		<h1> Your Idea Here! </h1>
	</div>
</div>

<?php require('includes/footer.php'); ?> 