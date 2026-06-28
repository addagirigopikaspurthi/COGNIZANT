public class ItemSearch {

    public static Item findLinear(Item[] items, int id) {

        for (Item item : items) {
            if (item.itemId == id) {
                return item;
            }
        }

        return null;
    }

    public static Item findBinary(Item[] items, int id) {

        int low = 0;
        int high = items.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (items[mid].itemId == id) {
                return items[mid];
            }

            else if (items[mid].itemId < id) {
                low = mid + 1;
            }

            else {
                high = mid - 1;
            }
        }

        return null;
    }
}
