public class StoreSearchTest {

    public static void main(String[] args) {

        Item[] items = {

                new Item(201, "Tablet", "Electronics"),
                new Item(202, "Sneakers", "Footwear"),
                new Item(203, "Headphones", "Electronics"),
                new Item(204, "Wallet", "Accessories"),
                new Item(205, "Backpack", "Travel")

        };

        int searchId = 203;

        System.out.println("Linear Search:");

        Item result1 = ItemSearch.findLinear(items, searchId);

        if (result1 != null)
            result1.showItem();
        else
            System.out.println("Item not found");

        System.out.println("\nBinary Search:");

        Item result2 = ItemSearch.findBinary(items, searchId);

        if (result2 != null)
            result2.showItem();
        else
            System.out.println("Item not found");
    }
}
