#include <stdio.h>
#define LENGTH 20

typedef struct Person {
  char *fname;
  char *lname;
  int age;
} Person;

extern int rand();
extern int find_oldest_person(Person* person, int length);

int _find_oldest_person(Person* person, int length) {
  if (person == NULL)
    return 0;

  Person* end = person + length * sizeof(Person);
  int mx = 0;
  while (person < end) {
    if (person->age > mx)
      mx = person->age;
  }

  return mx;
}

int main() {
  Person person[LENGTH];
  for (int i = 0; i < LENGTH; i++) {
    person[i].age = rand() % 5000;
    printf("%d\n", person[i].age);
  }

  int age = find_oldest_person(person, LENGTH);
  printf("%d\n", age);
  return 0;
}
