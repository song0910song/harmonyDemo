import { ContactPerson } from '../ViewModel/PersonModel'

export class ContactGroup {
  groupTitle: string
  contacts: ContactPerson[]

  constructor(title: string) {
    this.groupTitle = title
    this.contacts = []
  }
}