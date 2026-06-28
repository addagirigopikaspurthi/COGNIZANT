public class EcommerceSearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Phone", "Electronics"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Bag", "Fashion")

        };

        int searchId = 103;

        // Linear Search
        System.out.println("Linear Search Result:");

        Product result1 = SearchAlgorithms.linearSearch(products, searchId);

        if (result1 != null)
            result1.displayProduct();
        else
            System.out.println("Product not found");

        // Binary Search
        System.out.println("\nBinary Search Result:");

        Product result2 = SearchAlgorithms.binarySearch(products, searchId);

        if (result2 != null)
            result2.displayProduct();
        else
            System.out.println("Product not found");
    }
}