<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ubicaciones".
 *
 * @property int $id
 * @property string $ref
 * @property string $descripcion
 * @property int $id_alm
 *
 * @property Productos[] $productos
 * @property Almacenes $alm
 */
class Ubicaciones extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ubicaciones';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ref', 'descripcion'], 'required'],
            [['id_alm'], 'integer'],
            [['ref'], 'string', 'max' => 10],
            [['descripcion'], 'string', 'max' => 200],
            [['id_alm'], 'exist', 'skipOnError' => true, 'targetClass' => Almacenes::className(), 'targetAttribute' => ['id_alm' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ref' => 'Ref',
            'descripcion' => 'Descripcion',
            'id_alm' => 'Id Alm',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductos()
    {
        return $this->hasMany(Productos::className(), ['id_ubic' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAlm()
    {
        return $this->hasOne(Almacenes::className(), ['id' => 'id_alm']);
    }
}
