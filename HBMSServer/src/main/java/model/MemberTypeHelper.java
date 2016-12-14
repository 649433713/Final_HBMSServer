package model;

/**
 * Created by alex on 12/5/16.
 */
public class MemberTypeHelper {
    public MemberType getMemberType(int number){
        switch (number){
            case 0: return MemberType.Tourist;
            case 1: return MemberType.Person;
            case 2: return MemberType.Enterprise;
            default: return MemberType.Tourist;
        }
    }
}
