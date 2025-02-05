/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function add_to_cart(pid, pname, price) {


    let cart = localStorage.getItem("cart");
    if (cart == null) {
        //no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        
        showToast("Item is addedd to cart")



    } else {

        //cart is already present

        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid)


        if (oldProduct) {

            //only increase quantity only 

            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {

                if (item.productId === oldProduct.productId) {

                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));

            showToast(oldProduct.productName + "product Quantiity is increased, Quantity =  " + oldProduct.productQuantity)

        } else {

            //add product  
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));

            showToast("product is added to cart")
        }

    }
    updateCart();
}

// update cart 
function updateCart() {


    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);


    if (cart == null || cart.length == 0) {
        console.log("Cart is empty")
        $(".cart-items").html("( 0 ) ");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").attr('disabled',true)


    } else {

        //there is something
        console.log(cart)
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
        <table class='table'>
        <thead class='thread-light'>
        
        <tr>
        <th>Item Name </th>
        <th>Price </th>
        <th>Quantity </th>
        <th>Total Price </th>
        <th>Action </th>
        
        </tr>
        
        
        </thead>
        
        

            `;

        let totalPrice = 0;
        cart.map((item) => {

            table += `
                    
            <tr>
                <td> ${item.productName} </td>
                <td> ${item.productPrice} </td>
                <td> ${item.productQuantity} </td>
                <td> ${item.productQuantity * item.productPrice} </td>
                <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button> </td>
            </tr>
                `
            totalPrice += item.productPrice * item.productQuantity;


        })
        table = table + `
            <tr>
                <td colspan='5' class="text-right font-weight-bold m-5">
                   Total Price: ${totalPrice} 
                </td>   
            </tr>
        </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false)
        console.log("removed")
    }


}


//delete item /remove from cart 
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart', JSON.stringify(newCart))

    updateCart();

    showToast("item removed from cart")

}

$(document).ready(function () {
        updateCart();
    })
//v 25 min 19 to run this function 



            

function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

//got checkout

function goToCheckout(){
    window.location="checkout.jsp"
}