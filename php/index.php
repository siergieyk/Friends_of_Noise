<?php require('includes/header.php'); ?> 	
  
  <section id="account" class="width">
    <div class="container">      
       	<div class="content">
			<h1>Login or Create an Account</h1><br />
			<hr>
		</div>			
		<div class="login">
			<form class="registed">
				<h2>Registed Member</h2>			
				<p>If you have an account with us, please sign in your account.</p><br/>
							
				<div class="email">
					<strong>Email Adress: </strong><sup class="asterism">*</sup><br/>
					<input type="email" name="" class="" value="" />
				</div>
							
				<div class="password">
					<strong>Password: </strong><sup class="asterism">*</sup><br/>
					<input type="password" name="" class="" value="" />
					<a class="forgot" href="#">Forgot Your Password?</a>
				</div>
				
				<div class="submit">								
					<input type="submit" value="Sign In" />
					<sup class="sup">* </sup><span>Required Field</span>
				</div>
			</form>             
       </div>

       	<div class="login new">
			<h2>New Member</h2>
			<p>Create your FREE account, you will be able to view and track your orders in your account and more.</p>			
			<button class="account">Sign Up</button>
        </div>
      </div>
    </div>
  </section>  
  
<?php require('includes/footer.php'); ?>