<?php require('includes/header.php'); ?>   
  
  <section id="account" class="width">
    <div class="container">      
        <div class="content">
          <h1>Checkout</h1><br />
          <hr>
        </div>
        
        <div class="checkout">
          <div class="music">
              <div class="image">
                 <a href="single-event.php"><img src="images/Hero-compressor.jpg"></a>
              </div>
             
          <table class="table">
            <tr>
              <td><strong>Upcoming Event: </strong></td>
              <td>Music Festival</td>
            </tr>
            <tr>
              <td><strong>Date: </strong></td>
              <td>April 15, 2019 6:00 PM</td>
            </tr>
            <tr>
              <td><strong>Member Cost: </strong></td>
              <td>$ 50</td>
            </tr>
            <tr>
              <td><strong>Non-Member: </strong></td>
              <td>$150</td>
            </tr>
            <tr>
              <td><strong>Category: </strong></td>
              <td class="category">
                 <a href="https://fon.ichortest.com/">Music</a>
                 <a href="https://fon.ichortest.com/">Events</a>
              </td>
            </tr>
            <tr>
              <td><strong>Location: </strong></td>
              <td>Example High School</td>
            </tr>
            <tr>
              <td><strong>Address: </strong></td>
              <td>1234 Example St, OR</td>
            </tr>     
          </table>
          <br />            
        </div>

          <div class="leftcolumn"> 
           <form class="guest">  
              
              <ul class="radio">
                <h3>Buy Event Ticket</h3>
                <li><input type="radio" id="guest" name="type" value="guest" >
                  <label for="guest">Checkout as Guest</label></li>
                <li><input type="radio" id="member" name="type" value="member">
                  <label for="member">Register a Member</label></li>
                <br />             
                <input type="submit" value="Checkout" />
               </ul>
            </form>
          </div>

          <div class="rightcolumn">
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
                  <a class="forgot" href="forgot.php">Forgot Your Password?</a>
                </div>
                
                <div class="submit">                
                  <input type="submit" value="Sign In" />
                  <sup class="sup">* </sup><span>Required Field</span>
                </div>
              </form>             
            </div>
    </div>
  </section>
  
<?php require('includes/footer.php'); ?>