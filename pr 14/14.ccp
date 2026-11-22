#include <iostream>
#include <string>
#include <clocale>

using namespace std;

class Material {
protected:
    string materialType;
    string materialName;
    bool natural;

public:
    Material() : materialType(""), materialName(""), natural(false) {}

    Material(string type, string name, bool nat)
        : materialType(type), materialName(name), natural(nat) {}

    void setMaterialType(string t) { materialType = t; }
    void setMaterialName(string n) { materialName = n; }
    void setNatural(bool nat) { natural = nat; }

    string getMaterialType() const { return materialType; }
    string getMaterialName() const { return materialName; }
    bool isNatural() const { return natural; }

    void createMaterial(string type, string name, bool nat) {
        materialType = type;
        materialName = name;
        natural = nat;
    }

    void printMaterial() const {
        cout << "Матеріал: тип = " << materialType
             << ", назва = " << materialName
             << ", природність = " << (natural ? "природний" : "штучний") << endl;
    }
};

class FunctionalDevice {
protected:
    string deviceName;
    string ageRecommendation;

public:
    FunctionalDevice() : deviceName(""), ageRecommendation("") {}

    FunctionalDevice(string name, string age)
        : deviceName(name), ageRecommendation(age) {}

    void setDeviceName(string n) { deviceName = n; }
    void setAgeRecommendation(string a) { ageRecommendation = a; }

    string getDeviceName() const { return deviceName; }
    string getAgeRecommendation() const { return ageRecommendation; }

    void createDevice(string name, string age) {
        deviceName = name;
        ageRecommendation = age;
    }

    void printDevice() const {
        cout << "Функціональне пристосування: назва = " << deviceName
             << ", вікові рекомендації = " << ageRecommendation << endl;
    }
};

class Furniture : public Material, public FunctionalDevice {
private:
    string type;
    string name;

public:
    Furniture() : Material(), FunctionalDevice(), type(""), name("") {}

    Furniture(string t, string n,
              string matType, string matName, bool nat,
              string devName, string age)
        : Material(matType, matName, nat),
          FunctionalDevice(devName, age),
          type(t), name(n) {}

    void setType(string t) { type = t; }
    void setName(string n) { name = n; }

    string getType() const { return type; }
    string getName() const { return name; }

    void createFurniture(string t, string n,
                         string matType, string matName, bool nat,
                         string devName, string age) {
        type = t;
        name = n;
        createMaterial(matType, matName, nat);
        createDevice(devName, age);
    }

    void printFurniture() const {
        cout << "Меблі: тип = " << type << ", назва = " << name << endl;
        printMaterial();
        printDevice();
    }
};

int main() {
    setlocale(LC_ALL, "Ukrainian");

    Furniture f1("Ліжко", "Трансформер", "Дерево", "Дуб", true,
                 "Підйомний механізм", "3+ років");

    cout << "=== Меблі 1 ===" << endl;
    f1.printFurniture();
    cout << endl;

    Furniture f2;
    f2.createFurniture("Стілець", "Зростаючий", "Пластик", "Поліпропілен", false,
                       "Регулювання висоти", "5-12 років");

    cout << "=== Меблі 2 ===" << endl;
    f2.printFurniture();
    cout << endl;

    cout << "=== Зміна даних через set-методи ===" << endl;
    f2.setName("Школяр");
    f2.setMaterialName("Бук");
    f2.setMaterialType("Дерево");
    f2.setNatural(true);
    f2.setAgeRecommendation("6-14 років");
    f2.printFurniture();

    return 0;
}
