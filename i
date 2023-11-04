---
- name: Handlers
  hosts: all
  tasks:
    - name: install apache2 s/w
      apt:
        name: apache2
        state: present:
        update_cache: yes
    - name: copy content index.html
      copy:
        content: " Wellcome to the new group"
        dest: /var/www/html/index.html
      notify: Restart the service
  handlers:      
    - name: Restart the service
      service:
        name: apache2
        state: restarted
    - name: check url response
      uri:
        url: "{{item}}"
        status_code: 200
      with_items: 
        - http://172.31.3.191
        - htpp://172.31.9.243
...
