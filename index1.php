<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>House Rent Website</title>
  <!--link to CSS-->
  <link rel="stylesheet" href="style.css">
  <!--Box Icons-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
  <!--Navbar-->
  <header>
    <div class="nav container">
      <!--Logo-->
      <a href="index.html" class="logo"><i class='bx bx-home'></i>Pro Flats</a>
      <!--Menu Icon-->
      <input type="checkbox" name="" id="menu">
      <label for="menu"><i class='bx bx-menu' id="menu-icon"></i></label>
      <!--Nav List-->
      <ul class="navbar">
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#sales">Sales</a></li>
      </ul>
      <!--Log In Button-->
      <a href="login.php" class="btn">Log In</a> <!-- Updated link to point to login.php -->
    </div> 
  </header>
  <!--Home-->
  <section class="home container" id="home">
    <div class="home-text">
      <h1>Find Your Next <br> Perfect Place To <br>Live.</h1>
      <a href="login.php" class="btn">Sign Up</a>
    </div>
  </section>
  <!--About-->
  <section class="about container" id="about">
    <div class="about-img">
      <img src="img/third.jpg" alt="">
    </div>
    <div class="about-text">
      <span>About Us</span>
      <h2>We Provide The Best <br> Flat For You!</h2>
      <p>Luxurious and spacious, this meticulously-maintained home offers modern amenities for comfortable living.</p>
      <p>Conveniently located in a sought-after neighborhood, this charming rental boasts proximity to schools, shopping, and parks.</p>
      <p>With a tranquil backyard oasis and updated interiors, this rental provides the perfect retreat for your next chapter.</p>
      <a href="#" class="btn">Learn More</a>
    </div>
  </section>
  <!--sales-->
  <section class="sales container" id="sales">
    <!--Box1-->
    <div class="box">
      <i class='bx bx-user'></i>
      <h3>Make Your Dream True</h3>
      <p>Invest in your future with this ideal home for renting out—earn passive income and build wealth.</p>
    </div>
    <!--Box2-->
    <div class="box">
      <i class='bx bx-desktop'></i>
      <h3>Start Your Membership</h3>
      <p>Discover the opportunity of owning a rental property, generating steady cash flow and securing your financial stability.</p>
    </div>
    <!--Box3-->
    <div class="box">
      <i class='bx bx-home-alt'></i>
      <h3>Enjoy Your New Flat</h3>
      <p>Unlock the potential of real estate investment with this ready-to-rent house—make a smart choice for your financial growth.</p>
    </div>
  </section>
  <!--NewsLetter-->
  <section class="newsletter container">
    <h2>Have Question in mind? <br>Let us help you</h2>
    <form action="">
      <input type="email" name="" id="email-box" placeholder="yourmail@gmail.com" required>
      <input type="submit" value="send" class="btn">
    </form>
  </section>
  <!--Footer-->
  <section class="footer">
    <div class="footer-container container">
      <h2>Pro Flats</h2>
      <div class="footer-box">
        <h3>Quick Links</h3>
        <a href="#">Agency</a>
        <a href="#">Building</a>
        <a href="#">Rates</a>
      </div>
      <div class="footer-box">
        <h3>Location</h3>
        <a href="#">Belthangadi</a>
      </div>
      <div class="footer-box">
        <h3>Contact</h3>
        <a href="#">8495024841</a>
        <a href="#">aprathiksha36@gmail.com</a>
        <div class="social">
          <a href="#"><i class='bx bxl-facebook'></i></a>
          <a href="#"><i class='bx bxl-twitter'></i></a>
          <a href="#"><i class='bx bxl-instagram'></i></a>
        </div>
      </div>
    </div>
  </section>
  <div class="copyright">
    <p>&#169;CarpoolVenom All Right Reserved</p>
  </div>
  <!-- JavaScript code for connecting to backend API -->
  <script>
    fetch('http://localhost:3000/api/data')
      .then(response => response.json())
      .then(data => {
        console.log('Data received from backend:', data);
        // Handle the data as needed, e.g., update the UI
      })
      .catch(error => console.error('Error fetching data:', error));
  </script>
</body>
</html>
