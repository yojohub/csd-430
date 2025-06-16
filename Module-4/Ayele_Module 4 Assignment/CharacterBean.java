// CharacterBean.java
// Yohannes Ayele
// module-3 assignment
//date 4/15/25



package beans;

import java.io.Serializable;

// CharacterBean class holds character data and implements Serializable for JavaBean compliance
public class CharacterBean implements Serializable {

    // Fields to store character information
    private String name;
    private String role;
    private String quote;

    // No-argument constructor (required for JavaBeans)
    public CharacterBean() {
    }

    // Parameterized constructor to easily create and populate character objects
    public CharacterBean(String name, String role, String quote) {
        this.name = name;
        this.role = role;
        this.quote = quote;
    }

    // Getter and Setter methods for each field (JavaBean standard)

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }
}
