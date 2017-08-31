# Bad Advice - Always use Getters and Setters for DTO's

Many people recommend encapsulating fields using getters and setters, it however is not necessary for Data Transfer Objects as their is nothing to encapsulate. It impacts readability and usability of the class.

*Bad*
```java
public class Person {
    private String firstName;
    private String lastName;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
```


*Better*
```java
public class Person {
    public String firstName;
    public String lastName;
}
```


*Best*
```java
public class Person {
    public String firstName, lastName; // combining multiple logical fields in a multiple declaration is ok

    public Person firstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public Person lastName(String lastName) {
        this.lastName = lastName;
        return this;
    }
    public Person name(String first, String last) {
        this.firstName = first;
        this.lastName = last;
        return this;
    }

    public String getName() {
        return firstName + " " + lastName;
    }
}
```

The last option allows for creating and populating objects in a [fluent](https://martinfowler.com/bliki/FluentInterface.html) way:

```java
Person john = new Person()
    .firstName("John")
    .lastName("Doe");

Person jane = new Person()
    .name("Jane", "Doe");

assert jane.getName().equals("Jane Doe")
```
