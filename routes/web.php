<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

//product Category List

use Illuminate\Http\Request;

$router->get('/', function () {
    return 'API Server';
});

/*$router->get('/mailtest', function () {
    $order = \App\Models\Order::with(['customer', 'paymentMethod', 'orderItems'])->find(9);

   //dd($order);

    $data = [
        'name' => optional($order->customer)->name,
        'email' => optional($order->customer)->email,
        'subject' => "IFAD eShop: Order Placing Notification",
    ];

    return view('Email.send_order', [
        'invoice_id' => $order->id,
        'customer_name' => optional($order->customer)->name,
        'orderItems' => $order->orderItems,
        'grand_total' => $order->grand_total,
        'shipping_address' => $order->shipping_address,
    ]);

    Mail::send('Email.send_order', [
        'invoice_id' => $order->id,
        'customer_name' => $order->customer->name,
    ], function ($message) use ($data) {
        $message->to($data["email"], $data["name"]);
        $message->from(config('mail.from.address'), config('mail.from.name'));
        $message->subject($data["subject"]);
    });
});*/

$router->get('/categories', 'ProductController@allCategory');
//product Category id wies subcategory List /{1}
$router->get('/categories/{id}', 'ProductController@allSubCategory');
//product Category with subcategory List
$router->get('/categories_with_subcategory', 'ProductController@allCategroyWithSubCategorylist');
//category id wise prodcut
$router->get('/categories_id_wise_product/{id}', 'ProductController@CategoryidWiseProduct');
//sub category id wise prodcut
$router->get('/subcategories_id_wise_product/{id}', 'ProductController@SubCategoryidWiseProduct');
//prodcut list
$router->get('/product-list', 'ProductController@productList');
//prodcut list
$router->get('/product-list/{id}', 'ProductController@productIdWiseDetails');


$router->get('/products', 'ProductController@allProduct');

$router->get('/products/{id}', 'ProductController@singleProduct');

//document list
$router->get('/documents', 'DocumentController@allDocument');

//settings list
$router->get('/settings', 'SettingsController@allSettings');

//test product
//$router->get('/testproduct', 'ProductController@testProduct');

//Contact
$router->get('/contacts', 'ContactController@allContact');

//
$router->get('/picture-categories', 'GalleryCategoryController@galleryPictureCategory');
//
$router->get('/video-categories', 'GalleryCategoryController@galleryVideoCategory');
//picture
$router->get('/pictures', 'PictureController@allPictures');
//video
$router->get('/videos', 'VideoController@allVideos');

//blog
$router->get('/blogs', 'BlogController@allBlog');

//id wise blog details
$router->get('/blogs/{id}', 'BlogController@blogDetails');


$router->get('/cotent-items', 'ContentItemController@contentItemDetails');

$router->get('/content-module/{id}', 'ContentModuleController@contentModule');

// mail department
$router->get('/mail-departments', 'MailSettingsController@allMailDepartment');

//website menus
$router->get('/menus', 'ModuleController@menus');

//send mail
//$router->get('/send-email', 'MailController@sendEmail');

$router->post('/send-email', 'MailController@sendEmail');
//product Search
$router->get('/search/{name}', 'SearchController@Search');

$router->get('/facebook/auth', function () {
    $fb = new \Facebook\Facebook([
        'app_id' => '395302542958449',
        'app_secret' => '53d2219f068d9803744e3c5b240600c1',
        'default_graph_version' => 'v2.5',
    ]);

    $helper = $fb->getRedirectLoginHelper();
    $permissions = ['email', 'user_birthday'];

    return $helper->getLoginUrl('http://localhost/facebook-login-using-php/', $permissions);
});

$router->get('/facebook/callback', function (Request $request) {
    $fb = new Facebook\Facebook([
        'app_id' => '395302542958449', // your app id
        'app_secret' => '53d2219f068d9803744e3c5b240600c1', // your app secret
        'default_graph_version' => 'v2.5',
    ]);

    $helper = $fb->getRedirectLoginHelper();

    try {
        $accessToken = $helper->getAccessToken();
    } catch (Exception $exception) {
        throw $exception;
    }

    if (isset($accessToken)) {
        $oAuth2Client = $fb->getOAuth2Client();
        $longLivedAccessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
        $fb->setDefaultAccessToken($longLivedAccessToken);
    }

    try {
        $profile_request = $fb->get('/me?fields=name,first_name,last_name,email');
        $profile = $profile_request->getGraphUser();
        $fbid = $profile->getProperty('id');
        $fbfullname = $profile->getProperty('name');
        $fbemail = $profile->getProperty('email');
    } catch (Exception $exception) {
        throw $exception;
    }
});

/*Ecom*/
$router->group(['prefix' => 'ecom'], function () use ($router) {
    $router->get('/', function () {
        return 'IFAD Ecom Ready';
    });

    include_once 'ecom/Auth.php';
    include_once 'ecom/Wishlist.php';
    include_once 'ecom/Combo.php';
    include_once 'ecom/ComboCategory.php';
    include_once 'ecom/Customer.php';
    include_once 'ecom/Address.php';
    include_once 'ecom/Category.php';
    include_once 'ecom/SubCategory.php';
    include_once 'ecom/Inventory.php';
    include_once 'ecom/Order.php';
    include_once 'ecom/PaymentMethod.php';
    include_once 'ecom/Common.php';
    include_once 'ecom/Review.php';
    include_once 'ecom/Division.php';
    include_once 'ecom/Districts.php';
    include_once 'ecom/Upazila.php';
    include_once 'ecom/Coupon.php';
    include_once 'ecom/ConditionalDiscount.php';
});
