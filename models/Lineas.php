<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lineas".
 *
 * @property int $id
 * @property int $id_dep
 * @property string $ref
 * @property string $descripcion
 *
 * @property Departamentos $dep
 */
class Lineas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lineas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_dep', 'ref', 'descripcion'], 'required'],
            [['id_dep'], 'integer'],
            [['ref'], 'string', 'max' => 10],
            [['descripcion'], 'string', 'max' => 300],
            [['id_dep'], 'exist', 'skipOnError' => true, 'targetClass' => Departamentos::className(), 'targetAttribute' => ['id_dep' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_dep' => 'Id Dep',
            'ref' => 'Ref',
            'descripcion' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDep()
    {
        return $this->hasOne(Departamentos::className(), ['id' => 'id_dep']);
    }
}
