<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "departamentos".
 *
 * @property int $id
 * @property string $descripcion
 * @property string $ref
 *
 * @property Lineas[] $lineas
 */
class Departamentos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'departamentos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion', 'ref'], 'required'],
            [['descripcion'], 'string', 'max' => 300],
            [['ref'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'descripcion' => 'Descripcion',
            'ref' => 'Ref',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLineas()
    {
        return $this->hasMany(Lineas::className(), ['id_dep' => 'id']);
    }
}
