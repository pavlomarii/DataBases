ALTER TABLE temp.auto  
	DROP FOREIGN KEY fk_auto_typeauto,
	DROP INDEX fk_auto_type1_idx;

ALTER TABLE temp.auto 
	DROP COLUMN volume_power, 
	MODIFY COLUMN transmission VARCHAR(50) NULL;

ALTER TABLE temp.type
	MODIFY COLUMN description VARCHAR(300) NOT NULL;


ALTER TABLE temp.type
	MODIFY id INT UNSIGNED NOT NULL,
	ADD COLUMN version_id TINYINT UNSIGNED NOT NULL AFTER id,
	ADD CONSTRAINT UNIQUE UQ_id_version (id, version_id);
	
ALTER TABLE temp.model
	DROP FOREIGN KEY fk_model_mark,
	ADD CONSTRAINT model_mark FOREIGN KEY (mark_id)
	REFERENCES temp.mark (id) ON DELETE CASCADE;



