import React from 'react';
import {
  Filter,
  List,
  Edit,
  Create,
  Datagrid,
  ReferenceField,
  TextField,
  EditButton,
  DisabledInput,
  LongTextInput,
  ReferenceInput,
  SelectInput,
  SimpleForm,
  TextInput,
  Toolbar,
  SaveButton
} from 'react-admin';

export const ClientList = props => (
  <List {...props}>
    <Datagrid>
      <TextField source="id" />
      <TextField source="fname" />
      <TextField source="lname" />
      <EditButton basePath="/client" />
    </Datagrid>
  </List>
);

const PostCreateToolbar = props => (
  <Toolbar {...props}>
    {/* <SaveButton
            label="post.action.save_and_show"
            redirect="show"
            submitOnEnter={true}
        /> */}
    <SaveButton label="Submit" submitOnEnter={false} />
  </Toolbar>
);

const redirect = (basePath, id, data) => `/confirmation/${data.id}`;

export const ClientCreate = props => (
  <Create {...props}>
    <SimpleForm toolbar={<PostCreateToolbar />} redirect={redirect}>
      <h4>Submit New Referral</h4>
      <TextInput source="fname" label="First Name" />
      <TextInput source="lname" label="Last Name" />
      <TextInput source="email" label="Email" />
      <TextInput source="phone" label="Phone Number" />
      <TextInput source="photo" label="Photo (url)" />
    </SimpleForm>
  </Create>
);

export const ClientEdit = props => (
  <Edit {...props}>
    <SimpleForm>
      <DisabledInput source="id" />
      <LongTextInput source="fname" />
      <LongTextInput source="lname" />
    </SimpleForm>
  </Edit>
);