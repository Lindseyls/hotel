<!-- 04/01/18 -->

<!-- 1. What classes does each implementation include? Are the lists the same? -->

Implementation A classes: CartEntry, ShoppingCart and Order
Implementation B classes: CartEntry, ShoppingCart and Order

The list of classes between implementation A and B are the same.

<!-- 2. Write down a sentence to describe each class. -->

Implementation A classes: Both the CartEntry and ShoppingCart classes carry one single responsibility. However, all the logic to carry out those various responsibilities, such as calculating the subtotal and the total, are located in one place inside the Order class. The Order class is the "master" class that is in charge of all behavior, and other classes are only used to store state.
Implementation B classes: The logic has been delegated to "low level" classes, CartEntry and ShoppingCart. The Order class no longer carries all the behavior.

<!-- 3. How do the classes relate to each other?  -->

Implementation A classes: The Order class creates an instance of the ShoppingCart class in its initialize. Then in the total_price method it carries out all the logic by finding each entry's unit price and quantity and calculating the subtotal and then the final total with tax included.

Implementation B classes: Each class carries its own singal responsibility. The CartEntry class takes in each entry's quantity and price and calculates that entry's total price. Then, the ShoppingCart class adds up all entries and calculates the subtotal. Finally, the Order class calculates the final total with the sales tax.

<!-- 4. What data does each class store? How (if at all) does this differ between the two implementations? -->

Implementation A classes:
CartEntry - unit_price & quantity
ShoppingCart - all entries
Order - the sales tax, all entries, the price of each entry, the subtotal and the final total with the sales tax

Implementation B classes:
CartEntry - unit_price & quantity and the price of each entry
ShoppingCart - all entries and the subtotal
Order - the sales tax, all entries and the final total with the sales tax

The Order class in implementation A carries all the responsibilities. While the responsibility is spread out evenly between all three classes in implementation B.

<!-- 5. What methods does each class have? How (if at all) does this differ between the two implementations? -->

Implementation A classes:
CartEntry - initialize
ShoppingCart - initialize
Order - initialize and total_price

Implementation B classes:
CartEntry - initialize and price
ShoppingCart - initialize and price
Order - initialize and total_price

The Order class in implementation A carries all the responsibilities. While the responsibility of calculating the prices are spread out evenly between all three classes in implementation B.

<!-- Consider the Order#total_price method. In each implementation: -->

<!-- 6. Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order? -->

Implementation A classes: the logic to compute the price is retained in Order.

Implementation B classes: the logic to compute the price is delegated to "lower level" classes.

<!-- 7. Does total_price directly manipulate the instance variables of other classes? -->

Implementation A classes: yes

Implementation B classes: no

<!-- 8. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify? -->

If items are cheaper when bought in bulk, then we could apply a discount to quantities that are equal or over a certain specific amount. This would be easier to modify in implementation B because the of how logic is evenly delegated between each class, the discount can be added in any of the three classes and its methods. Whereas in implementation A, the only class that the logic can go into is the Order class.

<!-- 9. Which implementation better adheres to the single responsibility principle? -->

Implementation B better adheres to the single responsibility principles because each class is responsible for one thing and the dependency the Order class has on the other two classes is very loose.

<!-- 10. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled? -->

Continuing off of my previous answer, implementation B is more loosely coupled because if there is a change in one class it will not affect the other two classes. Especially in the Order class. Whereas in implementation A, if any changes were to be done to the first two classes, this could drastically change the code of Order class because it depends on both "low level" classes.
