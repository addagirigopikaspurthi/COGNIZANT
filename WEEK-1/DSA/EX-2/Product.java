public class Item {

    int itemId;
    String itemName;
    String itemCategory;

    public Item(int itemId, String itemName, String itemCategory) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemCategory = itemCategory;
    }

    public void showItem() {
        System.out.println("Item ID: " + itemId);
        System.out.println("Item Name: " + itemName);
        System.out.println("Item Category: " + itemCategory);
    }
}
