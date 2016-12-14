package model;

/**
 * Created by alex on 16-11-13.
 */
public enum PromotionType {
    HotelPromotion(0),
    WebPromotion(1),
    NoSuchPromotion(2);
    PromotionType(int value){
        this.value=value;
    }
    public int getValue(){
        return value;
    }

    //member
    private int value;
}
